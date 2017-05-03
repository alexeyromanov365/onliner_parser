#done

require 'spec_helper'
require 'site_opener'
require 'net/http'

LINK = "https://r.onliner.by/ak/apartments/215922".freeze

RSpec.describe SiteOpener do
  subject(:opener) { described_class.new(LINK) }
  describe '#open_site' do
    it 'shows us if url is exist' do
      expect(opener.open_site).not_to eq(nil)
    end
  end
end
