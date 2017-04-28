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
  attr_accessor :apartemts_collection

  def initialize(links = [])
    @links = links
    @apartemts_collection = []
  end

  def apartments_data_collector
    links.each do |link|
      page = SiteOpener.new(link)

      rooms = page.css(ROOMS)[0].text.strip
      owner = page.css(OWNER)[1].text.strip
      price_usd = page.css(PRICE_USD).text.strip
      price_byn = page.css(PRICE_BYN).text.strip
      description = page.css(DESCRIPTION).text.strip.gsub("\n", " ")
      adress = page.css(ADRESS).text.strip
      telephone = page.css(TELEPHONE).text.strip
      call_info = page.css(CALL_INFO)[1].text.strip
      owner_name = page.css(OWNER_NAME)[2].text.strip

      features_elements = page.css(ALL_ELEMENTS)
      all_elements = features_elements.map(&:text)
      enabled_elements = (all_elements - features_elements.css(ENABLED_ELEMENTS).map(&:text))
      disabled_elements = (all_elements - enabled_elements)

      @apartemts_collection += [rooms,

    end
  end
end

ApartmentsData.new.apartments_data_collector