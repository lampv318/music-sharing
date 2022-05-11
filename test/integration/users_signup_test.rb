require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end
    assert_equal flash[:danger], "Name can't be blank & Email is invalid & Password confirmation doesn't match Password & Password is too short (minimum is 6 characters)"
    assert_redirected_to signup_path
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "password" } }
    end

    assert_equal flash[:success], "Account create successfully!"
    assert_redirected_to root_url
  end
end
