class SiteOpener

  def attr_reader :link

  def initialize(link = '')
    @link = link
  end

  def open_site
    Nokogiri::HTML(open(link))
  end

end