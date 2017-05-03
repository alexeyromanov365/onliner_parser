# encoding: utf-8
#done

require 'spec_helper'
require 'apartments_collection'

LINK = "https://r.onliner.by/ak/apartments/219093".freeze

RSpec.describe ApartmentsCollection do
  subject(:apart) { described_class.new(LINK) }

  let(:apartments_hash) do
    {
      :rooms=>"1-комнатная квартира",
      :owner=>"Собственник",
      :price_usd=>"450 $",
      :price_byn=>"840,65 р.",
      :description=>
       "1е заселение!!! Новый ремонт,очень приятная и комфортабельная квартира! Новый дом(год постройки 2015). Полностью укомлектована. 100метров до метро. Прекрасная инфраструктура!",
      :address=>"Минск, проспект Газеты Правда, 17",
      :telephone=>"+375 29 338-98-45",
      :call_info=>"Звоните с 9 до 22 часов",
      :owner_name=>"Собственник",
      :enabled_elements=>
       ["Мебель",
        "Кухонная мебель",
        "Плита",
        "Холодильник",
        "Стиральная машина",
        "Телевизор",
        "Интернет",
        "Лоджия или балкон"],
      :disabled_elements=>["Кондиционер"]
   }
 end

  describe '#to_hash' do
    it 'makes hash of apartments' do
      expect(apart.to_hash).to eq(apartments_hash)
    end
  end
end
