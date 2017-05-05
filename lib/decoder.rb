require 'active_support/core_ext/hash'

class Decoder

  URL = "https://ak.api.onliner.by/search/apartments?".freeze

  attr_reader :input

  def initialize(input = {})
    @input = input
  end

  def decode_url
    URL + input.to_query
  end
end