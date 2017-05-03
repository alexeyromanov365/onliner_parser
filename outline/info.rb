require 'csv'
require 'pry'
require_relative 'site_opener'

class Info

  attr_reader :url_param

  ROOMS = "span.apartment-bar__value".freeze
  OWNER = "span.apartment-bar__value".freeze
  PRICE_USD = "span.apartment-bar__price-value.apartment-bar__price-value_complementary".freeze
  PRICE_BYN = "span.apartment-bar__price-value.apartment-bar__price-value_primary".freeze
  DESCRIPTION = "div.apartment-info__sub-line.apartment-info__sub-line_extended-bottom".freeze
  ADRESS = "div.apartment-info__cell.apartment-info__cell_66 > div.apartment-info__sub-line.apartment-info__sub-line_large".freeze
  TELEPHONE = "li.apartment-info__item".freeze
  CALL_INFO = "div.apartment-info__sub-line.apartment-info__sub-line_extended".freeze
  OWNER_NAME = "div.apartment-info__sub-line.apartment-info__sub-line_extended".freeze
  ALL_ELEMENTS = "div.apartment-options__item"
  ENABLED_ELEMENTS = ".apartment-options__item_lack"


  def initialize(url_param = {})
    @url_param = url_param
  end

  def collect_info
    all_links =  SiteOpener.new(url_param).site_links.flatten

    page = Nokogiri::HTML(open("https://r.onliner.by/ak/apartments/66059"))

    rooms = page.css(ROOMS)[0].text.strip
    owner = page.css(OWNER)[1].text.strip
    price_usd = page.css(PRICE_USD).text.strip
    price_byn = page.css(PRICE_BYN).text.strip
    description = page.css(DESCRIPTION).text.strip
    adress = page.css(ADRESS).text.strip
    telephone = page.css(TELEPHONE).text
    call_info = page.css(CALL_INFO)[1].text.strip
    owner_name = page.css(OWNER_NAME)[2].text.strip
    features_elements = page.css(ALL_ELEMENTS)
    all_elements = features_elements.map(&:text)
    enabled_elements = all_elements - features_elements.css(ENABLED_ELEMENTS).map(&:text)
    disabled_elements = all_elements - enabled_elements

    info_array = []
    info_array += [rooms, owner, price_usd, price_byn, description, adress, tel, call_info, owner_name, enabled_elements, disabled_elements]
    File.open("out.csv", "a+") { |f| f.write(info_array) }
  end
end
