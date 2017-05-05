require 'spec_helper'
require 'csv_storage'

RSpec.describe CsvStorage do
  subject(:my_file) { described_class.new(apartments_hash) }

  let(:apartments_hash) do
    {
      room: "2-комнаты",
      owner: "Сообственник"
    }
  end

  before(:each) { my_file.write_apartments_info }

  after(:each) { File.delete("apartments_data.csv") }

  describe '#write_apartments_info' do
    it 'is exist' do
      expect(File).to exist("apartments_data.csv")
    end
  end

  describe '#write_apartments_info' do
    it 'has apartments_hash' do
      expect(File.read("apartments_data.csv")).to eq(apartments_hash.inspect)
    end
  end
end

