require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext/hash'
require 'pry'
require 'json'

class SiteOpener

  URL = "https://ak.api.onliner.by/search/apartments?".freeze

  attr_reader :url_param

  def initialize(url_param = {})
    @url_param = url_param
  end

  def site_links
    num_pages.times.map do |i|
      decoded_url = decode_url.gsub(/page=\d/){"page=#{i+=1}"}
      site_path = Nokogiri::HTML(open(decoded_url))
      parse_url(site_path)
    end
  end

  private

  def parse_url(site_path)
    JSON(site_path)['apartments'].map do |link|
      link['url']
    end
  end

  def num_pages
    url_hash = JSON(open_site)['total']
    if url_hash/30 > 25
      return 25
    else (url_hash/30.0).ceil
    end
  end

  def open_site
    Nokogiri::HTML(open(decode_url))
  end

  def decode_url
    URL + url_param.to_query
  end

end