require 'nokogiri'
require 'open-uri'

class SiteOpener

  attr_reader :link

  def initialize(link = '')
    @link = link
  end

  def open_site
    Nokogiri::HTML(open(link))
  end

end