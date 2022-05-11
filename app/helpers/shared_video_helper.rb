module SharedVideoHelper
  def youtube_iframe_for(shared_video)
    video_id = matched_result(shared_video.url)

    '<iframe '\
      'width=100% '\
      'height=300px '\
      'frameborder="0" '\
      'allow="autoplay; fullscreen" '\
      'allowfullscreen, '\
      "src='https://www.youtube.com/embed/#{video_id}'>"\
    '</iframe>'
  end

  private

  def matched_result(url)
    match = SharedVideo::YOUTUBE_REGEX_URL.match(url)
    return false if match.blank? || match[1].blank?

    match[1]
  end
end
