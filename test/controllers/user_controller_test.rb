require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect root and flash success when user is create" do
    post users_path, params: { user: { name: "User", email: "user@example.com", password: "foobar", password_confirmation: "foobar"} }

    assert_equal flash[:success], "Account create successfully!"
    assert_redirected_to root_url
  end

  test "should redirect root and flash danger when user is create" do
    post users_path, params: { user: { name: "", email: "user@example.com", password: "foobar", password_confirmation: "foobar"} }

    assert_equal flash[:danger], "Name can't be blank"
    assert_redirected_to signup_url
  end
end
