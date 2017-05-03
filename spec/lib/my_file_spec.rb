#done

require 'spec_helper'
require 'my_file'

RSpec.describe MyFile do
  subject(:my_file) { described_class.new("csv", apartments_hash) }

  let(:apartments_hash) do
    {
      room: "2-комнаты",
      owner: "Сообственник"
    }
  end

  before(:each) { my_file.write_apartments_info }

  after(:each) { File.delete("apartments_data.#{my_file.file_format}") }

  describe '#write_apartments_info' do
    it 'is exist' do
      expect(File.exist?("apartments_data.#{my_file.file_format}")).to eq(true)
    end
  end

  describe '#write_apartments_info' do
    it 'has apartments_hash' do
      expect(File.read("apartments_data.#{my_file.file_format}")).to eq(apartments_hash.inspect)
    end
  end
end

