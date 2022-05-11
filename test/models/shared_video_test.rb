require "test_helper"

class SharedVideoTest < ActiveSupport::TestCase
  def setup
    @share_video = SharedVideo.new(url: 'https://www.youtube.com/watch?v=f9WIBYwLnb0', user_id: users(:michael).id)
  end

  test "should be valid" do
    assert @share_video.valid?
  end

  test "user_id should be present" do
    @share_video.user_id = nil
    assert_not @share_video.valid?
  end

  test "url should be present" do
    @share_video.url = "     "
    assert_not @share_video.valid?
  end

  test "url validation should be valid" do
    youtube_urls = %w[ https://www.youtube.com/watch?v=f9WIBYwLnb0
                       https://www.youtube.com/embed/4LfJnj66HVQ
                       https://www.youtube-nocookie.com/embed/xHkq1edcbk4?rel=0
                       https://youtu.be/4LfJnj66HVQ
                       youtu.be/4LfJnj66HVQ]
    youtube_urls.each do |youtube_url|
      @share_video.url = youtube_url
      assert @share_video.valid?
    end
  end

  test "url validation should be invalid" do
    youtube_urls = %w[ https://www.youtubeee.com/watch?v=f9WIBYwLnb0
                       https://www.youtube/embed/4LfJnj66HVQ
                       https://www.youtube-nocooke.com/embed/xHkq1edcbk4?rel=0
                       https://youtu.beee/4LfJnj66HVQ
                       https://google.com
                       dummy]
    youtube_urls.each do |youtube_url|
      @share_video.url = youtube_url
      assert_not @share_video.valid?
    end
  end
end
