require 'rails_helper'

RSpec.describe SharedVideosController, type: :controller do
  describe 'POST #create' do
    subject { post :create, params: params }
    let!(:user) { create(:user) }
    let(:login_params) do
      { session:
        {
          email: user.email,
          password: user.password
        }
      }
    end

    before do
      controller.instance_variable_set(:@current_user, user)
    end

    context 'Create shared video is Successfully' do
      let(:params) do
        { shared_video:
          {
            title: 'title',
            url: 'https://youtu.be/AnMhdn0wJ4I?list=RDtk36ovCMsU8'
          }
        }
      end

      it 'should have flash success and redirect_to root_url' do
        expect(user.shared_videos.count).to eq 0

        subject
        expect(flash[:success]).to eq "Share Youtube Video Successfully"
        expect(response).to redirect_to(root_url)
        expect(user.shared_videos.count).to eq 1
      end
    end

    context 'Create shared video is Failed' do
      let(:params) do
        { shared_video:
          {
            title: 'title',
            url: 'https://dummy'
          }
        }
      end

      it 'should have danger success and redirect_to root_url' do
        expect(user.shared_videos.count).to eq 0

        subject
        expect(flash[:danger]).to eq "Invalid URL"
        expect(response).to redirect_to(root_url)
        expect(user.shared_videos.count).to eq 0
      end
    end
  end
end
