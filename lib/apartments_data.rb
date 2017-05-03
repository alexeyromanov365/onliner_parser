require_relative 'site_open'

class ApartmentsData

  ROOMS = "span.apartment-bar__value".freeze
  OWNER = "span.apartment-bar__value".freeze
  PRICE_USD = "span.apartment-bar__price-value.apartment-bar__price-value_complementary".freeze
  PRICE_BYN = "span.apartment-bar__price-value.apartment-bar__price-value_primary".freeze
  DESCRIPTION = "div.apartment-info__sub-line.apartment-info__sub-line_extended-bottom".freeze
  ADDRESS = "div.apartment-info__cell.apartment-info__cell_66 > div.apartment-info__sub-line.apartment-info__sub-line_large".freeze
  TELEPHONE = "li.apartment-info__item".freeze
  CALL_INFO = "div.apartment-info__sub-line.apartment-info__sub-line_extended".freeze
  OWNER_NAME = "div.apartment-info__sub-line.apartment-info__sub-line_extended".freeze
  ALL_ELEMENTS = "div.apartment-options__item".freeze
  ENABLED_ELEMENTS = ".apartment-options__item_lack".freeze

  attr_reader :links

  def initialize(links = [])
    @links = links
  end

  def apartments_data_collector
    links.map do |link|
      ApartmentsCollection.new(link).to_hash
    end
  end
end



