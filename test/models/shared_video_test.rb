require "test_helper"

class SharedVideoTest < ActiveSupport::TestCase
  def setup
    @share_video = SharedVideo.new(url: 'https://www.youtube.com/watch?v=f9WIBYwLnb0', user_id: users(:michael).id)
  end

  test "should be valid" do
    assert @share_video.valid?
  end

  test "url should be present" do
    @share_video.url = "     "
    assert_not @share_video.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
end
