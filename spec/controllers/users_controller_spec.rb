require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    it '@user variable is defined' do
      subject
      expect(controller.instance_variable_get(:@user).new_record?).to eq true
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    context 'create user is successfully' do
      let(:params) do
        {
          user: {
            name: 'test',
            email: 'test@test.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      it 'user should be created and redirect_to root_url' do
        expect(User.count).to eq 0
        subject

        expect(flash[:success]).to eq "Create Account Successfully"
        expect(response).to redirect_to(root_url)
        expect(User.count).to eq 1
      end
    end

    context 'create user is failed' do
      let(:params) do
        {
          user: {
            name: 'test',
            email: 'test',
            password: 'password',
            password_confirmation: 'password1'
          }
        }
      end

      it 'user should be created and redirect_to root_url' do
        expect(User.count).to eq 0
        subject

        expect(flash[:danger]).to eq "Email is invalid & Password confirmation doesn't match Password"
        expect(response).to redirect_to(signup_url)
        expect(User.count).to eq 0
      end
    end
  end
end
