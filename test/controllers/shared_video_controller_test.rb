require 'test_helper'

class SharedVideosControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "should redirect index when not logged in" do
    post shared_videos_path, params: { url: 'google.com'}
    assert_redirected_to login_url
  end

  test "should redirect root_url and flash error" do
    log_in_as(@user)

    post shared_videos_path, params: { url: 'google.com'}

    assert_equal flash[:danger], "Url is invalid"
    assert_redirected_to root_url
  end

  test "should redirect root_url and flash success" do
    log_in_as(@user)

    post shared_videos_path, params: { url: 'https://www.youtube.com/watch?v=1CTced9CMMk&list=RDRKhsHGfrFmY&index=2'}

    assert_equal flash[:success], "Share Youtube Video Successfully"
    assert_redirected_to root_url
  end
end
