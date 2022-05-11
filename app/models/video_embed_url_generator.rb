class VideoEmbedUrlGenerator
  REGEX_ID = %r{(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{8,11})}.freeze

  attr_accessor :url
  attr_accessor :errors

  def initialize(url)
    @url = url
    @errors = []
  end

  def construct_iframe
    '<iframe '\
      'width="640" '\
      'height="480" '\
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
    unless video_id
      @errors << 'Invalid URL'

      return false
    end

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
