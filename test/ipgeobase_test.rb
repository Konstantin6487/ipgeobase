# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_load_address
    address_data_raw = read_fixture_file "geobase_raw.xml"
    ip = "83.169.216.199"
    url = build_url Ipgeobase::Location::API_URL, ip: ip
    run_stub url, method: :get, body: address_data_raw
    actual = Ipgeobase.lookup ip

    assert_equal "56.8333", actual.lat
    assert_equal "60.6", actual.lon
    assert_equal "Russia", actual.country
    assert_equal "RU", actual.countryCode
    assert_equal "Yekaterinburg", actual.city
  end
end
