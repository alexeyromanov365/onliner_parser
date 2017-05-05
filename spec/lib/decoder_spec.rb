require 'spec_helper'
require 'decoder'

RSpec.describe Decoder do
  subject(:decoder) { described_class.new(input) }

  let(:input) do
    {
      rent_type: ["room", "1_room"],
      price: {
        min: 500,
        max: 800,
      },
      currency: 'usd',
      only_owner: '',
      metro: ['red_line', 'blue_line'],
      page: 1,
      bounds: {
        lb: {
          lat: 53.6717870980501,
          long: 27.365152809086844,
        },
        rt: {
          lat: 54.13184173667686,
          long: 27.759527091732025,
        },
      },
    }
  end

  let(:output) do
    "https://ak.api.onliner.by/search/apartments?bounds%5Blb%5D%5Blat%5D=53.6717870980501&bounds%5Blb%5D%5Blong%5D=27.365152809086844&bounds%5Brt%5D%5Blat%5D=54.13184173667686&bounds"\
    "%5Brt%5D%5Blong%5D=27.759527091732025&currency=usd&metro%5B%5D=red_line&metro%5B%5D=blue_line&only_owner=&page=1&price%5Bmax%5D=800&price%5Bmin%5D=500&rent_type%5B%5D=room"\
    "&rent_type%5B%5D=1_room"
  end

  describe '#decode_url' do
    it 'return decoded url' do
      expect(decoder.decode_url).to eq(output)
    end
  end
end