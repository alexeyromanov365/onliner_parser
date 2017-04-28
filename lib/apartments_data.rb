require_relative 'site_opener'

class ApartmentsData

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




  attr_reader :links

  def initialize(links = [])
    @links = links
  end

  def apartments_data_collection
    links.each do |link|
      page = SiteOpener.new(link)

  end

end