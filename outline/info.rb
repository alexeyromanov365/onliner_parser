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

    rooms = page.css(ROOMS)[0].text.strip #done
    owner = page.css(OWNER)[1].text.strip #done
    price_usd = page.css(PRICE_USD).text.strip # done
    price_byn = page.css(PRICE_BYN).text.strip # done
    description = page.css(DESCRIPTION).text.strip #done
    adress = page.css(ADRESS).text.strip #done
    telephone = page.css(TELEPHONE).text #done
    call_info = page.css(CALL_INFO)[1].text.strip #done
    owner_name = page.css(OWNER_NAME)[2].text.strip #done
    features_elements = page.css(ALL_ELEMENTS)
    all_elements = features_elements.map(&:text)
    enabled_elements = all_elements - features_elements.css(ENABLED_ELEMENTS).map(&:text)
    disabled_elements = all_elements - enabled_elements




    info_array = []
    info_array += [rooms, owner, price_usd, price_byn, description, adress, tel, call_info, owner_name, enabled_elements, disabled_elements]
    binding.pry

    File.open("out.csv", "a+") { |f| f.write(info_array) }

    binding.pry

  end
end



    #File.open("out.#{file_format}", [a+]) { |f| f.write("here write flats info")}

    #site_links.flatten.each do |link|
      #puts link
      #page = Nokogiri::HTML(open(link))
      #puts link.inspect
      #puts page.css("apartment-bar__value")
    #end


=begin
    #elements true false
    puts a = page.css("div.apartment-options__item").text #all elements
    a.each { |n| puts a.content }
    puts a.class
    #puts a.split /(?=[А-Я])/
    puts b = page.css("div.apartment-options__item.apartment-options__item_lack").text
    #puts b.split /(?=[А-Я])/
    puts a.class, b.class
=end





=begin


File.open("out.txt", [your-option-string]) {|f| f.write("write your stuff here") }
where your options are:

r - Read only. The file must exist.
w - Create an empty file for writing.
a - Append to a file.The file is created if it does not exist.
r+ - Open a file for update both reading and writing. The file must exist.
w+ - Create an empty file for both reading and writing.
a+ - Open a file for reading and appending. The file is created if it does not exist.

In your case, w is preferable.

OR you could have:

out_file = File.new("out.txt", "w")
#...
out_file.puts("write your stuff here")
#...
out_file.close






page.css("div.apartment-options__item").inject({}) do |result, element|
      if element.has_class
      result[:dibadle].merge! {  } if
    end





CSV.open("filename.csv", "w+") do |csv_file|
  results.each do |row|
    csv_file << row
  end
end



=end