require_relative 'opt_parse'

class Input

  attr_reader :input

  def initialize(input = {})
    @input = OptParse.new.parse_argv
  end

  def options
    {
      rent_type: rent_type,
      price: price,
      currency: currency,
      only_owner: only_owner,
      metro: metro,
      page: page,
      bounds: bounds
    }
  end

  private

  def rent_type
    ["room", "1_room", "2_rooms", "3_rooms", "4_rooms", "5_rooms","6_rooms"]
  end

  def price
    {
      min: 50,
      max: 8500
    }
  end

  def currency
    'usd'
  end

  def only_owner
    ''
  end

  def metro
    ['red_line', 'blue_line']
  end

  def page
    1
  end

  def bounds
    {
      lb: {
        lat: 53.6717870980501,
        long: 27.365152809086844,
        },
      rt: {
        lat: 54.13184173667686,
        long: 27.759527091732025,
      },
    }
  end
end