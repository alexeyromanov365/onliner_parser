require_relative 'save'

module Storage
  class CsvStorage < Save
    def write_apartments_info(apartments)
      CSV.open("apartments_data.csv", "w") do |csv|
      csv << [apartments]
      # rework
    end
  end
end