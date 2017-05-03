require 'spec_helper'
require 'site_opener_old'

RSpec.describe SiteOpenerOld do
  subject(:opener) { described_class.new }

  describe '#num_pages' do
    it 'return 25' do
      allow(opener).to receive(:decode_url).and_return("dfsflasld")
      binding.pry
      opener.num_pages
      expect(opener.num_pages).to eq(25)
    end
  end
end