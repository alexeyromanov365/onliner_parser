require 'optparse'

class Input

  options = {
    rent_type: ["room", "1_room", "2_rooms", "3_rooms", "4_rooms", "5_rooms","6_rooms"],
    price: {
      min: 50,
      max: 8500,
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

  save_options = {
    save_type: '.csv'
  }

  OptionParser.new do |opts|
    opts.on('-r','--rent_type type', Array, 'Number of rooms') { |o| options[:rent_type] = o }
    opts.on('--p_min minimal', 'Min price') { |o| options[:price][:min] = o }
    opts.on('--p_max price_max', 'Max price') { |o| options[:price][:max] = o }
    opts.on('-o','--owner owner', 'Only owner') { |o| options[:only_owner] = o }
    opts.on('-m','--metro metro', Array, 'Metro is existing') { |o| options[:metro] = o }
    opts.on('-s','--save save', 'Save option') { |o| save_options[:save_type] = o }
  end.parse!

end



