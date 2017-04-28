#require_relative 'apartments_data'

class File

  attr_reader :file_format, :apartments_info

  def initialize(file_format = 'csv', apartments_info = '')
    @file_format = file_format
    @apartments_info = apartments_info
  end

  def write_apartments_info
    File.open("apartments_data.#{file_format}", "a+") { |f| f.write(apartments_info) } rescue binding.pry
  end
end
