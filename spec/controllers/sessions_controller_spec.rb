require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    subject { post :create, params: params }
    let!(:user) { create(:user) }

    context 'Login is Successfully' do
      let(:params) do
        { session:
          {
            email: user.email,
            password: user.password
          }
        }
      end

      it 'should have flash success and redirect_to root_url' do
        subject
        expect(flash[:success]).to eq "Login Successfully"
        expect(response).to redirect_to(root_url)
      end
    end

    context 'Login is Failed' do
      let(:params) do
        { session:
          {
            email: 'user.email',
            password: 'password'
          }
        }
      end

      it 'should have flash danger and redirect_to login_url' do
        subject
        expect(flash[:danger]).to eq "Invalid email/password combination"
        expect(response).to redirect_to(login_url)
      end
    end
  end

  describe 'DELETE #destroy' do
   subject { delete :destroy, params: params }
    let!(:user) { create(:user) }
    let(:params) do
      { session:
        {
          email: user.email,
          password: user.password
        }
      }
    end

    before do
      post :create, params: params
    end

    context 'Logout is Successfully' do
      it 'should logout and redirect_to root_url' do
        subject
        expect(controller.instance_variable_get(:@current_user)).to eq nil
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
