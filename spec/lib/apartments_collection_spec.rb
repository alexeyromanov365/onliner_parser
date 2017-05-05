require 'spec_helper'
require 'apartments_collection'

LINK = "https://r.onliner.by/ak/apartments/224196".freeze

RSpec.describe ApartmentsCollection do
  subject(:apart) { described_class.new(LINK) }

  let(:apartments_hash) do
    {
      :rooms=>"1-комнатная квартира",
      :owner=>"Собственник",
      :price_usd=>"330 $",
      :price_byn=>"621,52 р.",
      :address => "Минск, улица Якуба Коласа, 47 к1",
      :call_info => "Звоните с 9 до 21 часа",
      :description => "Сдается 1-я квартира в центре. 5 мин до метро. Евроремонт. Вся бытовая техника (стиральная машина,микроволновая печь, варочная панель, "\
      "духовой шкаф, плазменный телевизор, кондиционер и др.) 2 шкафа купе. Маленькие коммунальные платежи",
      :disabled_elements => [],
      :enabled_elements => ["Мебель", "Кухонная мебель", "Плита", "Холодильник", "Стиральная машина", "Телевизор", "Интернет", "Лоджия или балкон", "Кондиционер"],
      :owner_name => "Катерина",
      :telephone => "+375 44 511-75-11"
    }
 end

  describe '#to_hash' do
    it 'makes hash of apartments' do
      expect(apart.to_hash).to eq(apartments_hash)
    end
  end
end
