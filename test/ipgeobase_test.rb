# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  API_URL = "http://ip-api.com"

  attr_reader :ip, :address

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def setup
    @address = read_fixture_file "geobase_raw.xml"
    @ip = "83.169.216.199"

    url = Addressable::Template.new("#{IpgeobaseTest::API_URL}{/segments*}")
    url.expand({ segments: ["xml", ip] })

    stub_request(:get, url).to_return(body: address)
  end

  def test_load_address
    parsed_fixture = Ox.load address, mode: :hash
    expected = parsed_fixture[:query]
    actual = Ipgeobase.lookup ip

    assert_equal(
      [expected[:city], expected[:country], expected[:countryCode], expected[:lat], expected[:lon]],
      [actual.city, actual.country, actual.countryCode, actual.lat, actual.lon]
    )
  end
end
