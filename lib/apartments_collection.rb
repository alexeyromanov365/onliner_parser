require_relative 'site_opener'

class ApartmentsCollection

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

  def initialize(link)
    @page = SiteOpener.new(link).open_site
  end

  def to_hash
    {
      rooms: rooms,
      owner: owner,
      price_usd: price_usd,
      price_byn: price_byn,
      description: description,
      address: address,
      telephone: telephone,
      call_info: call_info,
      owner_name: owner_name,
      enabled_elements: enabled_elements,
      disabled_elements: disabled_elements
    }
  end

  def rooms
    @page.css(ROOMS)[0].text.strip
  end

  def owner
    @page.css(OWNER)[1].text.strip
  end

  def price_usd
    @page.css(PRICE_USD).text.strip
  end

  def price_byn
    @page.css(PRICE_BYN).text.strip
  end

  def description
    @page.css(DESCRIPTION).text.strip.gsub("\n", " ")
  end

  def address
    @page.css(ADDRESS).text.strip
  end

  def telephone
    @page.css(TELEPHONE).text.strip
  end

  def call_info
    @page.css(CALL_INFO)[1].text.strip
  end

  def owner_name
    @page.css(OWNER_NAME)[2].text.strip
  end

  def all_elements
    @page.css(ALL_ELEMENTS).map(&:text)
  end

  def features_elements
    @page.css(ALL_ELEMENTS)
  end

  def enabled_elements
    all_elements - features_elements.css(ENABLED_ELEMENTS).map(&:text)
  end

  def disabled_elements
    all_elements - enabled_elements
  end
end