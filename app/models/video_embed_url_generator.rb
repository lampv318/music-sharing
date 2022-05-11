class VideoEmbedUrlGenerator
  REGEX_ID = %r{(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{8,11})}.freeze

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def construct_iframe
    '<iframe '\
      'width=100% '\
      'height=300px '\
      'frameborder="0" '\
      'allow="autoplay; fullscreen" '\
      'allowfullscreen, '\
      "src='#{construct_url}'>"\
    '</iframe>'
  end

  def construct_url
    "https://www.youtube.com/embed/#{video_id}"
  end

  def valid?
    return false unless video_id

    true
  end

  private

  def video_id
    matched_result(REGEX_ID)
  end

  def matched_result(regex)
    match = regex.match(url)
    return false if match.blank? || match[1].blank?

    match[1]
  end
end
