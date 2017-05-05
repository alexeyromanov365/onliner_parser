require 'optparse'

class OptParse

  def parse_argv
    OptionParser.new do |opts|
      opts.on('-r','--rent_type type', Array, 'Number of rooms') { |o| input[:rent_type] = o }
      opts.on('--p_min minimal', 'Min price') { |o| input[:price][:min] = o }
      opts.on('--p_max price_max', 'Max price') { |o| input[:price][:max] = o }
      opts.on('-o','--owner owner', 'Only owner') { |o| input[:only_owner] = o }
      opts.on('-m','--metro metro', Array, 'Metro is existing') { |o| input[:metro] = o }
    end.parse!
  end
end