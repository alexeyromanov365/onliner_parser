require_relative 'site_open'

class ApartmentsData

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