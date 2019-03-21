class Following
  attr_reader :handle,
              :url

  def initialize(following)
    @handle = following[:login]
    @url = following[:html_url]
  end
end
