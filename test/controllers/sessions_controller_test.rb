require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should be login when authenticate is ok" do
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }

    assert_equal flash[:success], "Login Successfully"
    assert_equal session[:user_id], @user.id
    assert_redirected_to root_url
  end

  test "should be flash danger when authenticate is not ok" do
    post login_path, params: { session: { email: @user.email,
                                          password: 'dummy' } }

    assert_equal flash[:danger], "Invalid email/password combination"
    assert_not_equal session[:user_id], @user.id
    assert_redirected_to login_url
  end
end
