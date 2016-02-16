require "./pokemon_service.rb"
require 'rubygems'
require 'test/unit'
require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "./vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

class VCRTest < Test::Unit::TestCase
  def test_pokemon_dot_com
    VCR.use_cassette("synopsis") do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
      assert_match /Example domains/, response.body
    end
  end
end
