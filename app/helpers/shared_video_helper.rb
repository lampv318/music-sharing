module SharedVideoHelper
  def youtube_iframe_for(shared_video)
    VideoEmbedUrlGenerator.new(shared_video.url).construct_iframe
  end
end
