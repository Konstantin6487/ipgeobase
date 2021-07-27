# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  attr_reader :api_url

  def setup
    @api_url = "http://ip-api.com"
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_load_address
    file_name = "geobase_raw.xml"
    address_data_raw = read_fixture_file file_name
    ext = file_name.split(".").last
    ip = "83.169.216.199"
    url = build_url api_url, ip: ip, ext: ext
    run_stub url, method: :get, body: address_data_raw

    expected = Ox.load(address_data_raw, mode: :hash)[:query]
    actual = Ipgeobase.lookup ip

    %i[city country countryCode lat lon]
      .each { |field| assert_equal expected[field], actual.instance_variable_get("@#{field}") }
  end
end
