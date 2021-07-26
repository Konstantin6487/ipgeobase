# frozen_string_literal: true

require "http"

module Ipgeobase
  # Location factory
  class Location
    API_URL = "http://ip-api.com/xml"

    def lookup(ip)
      url = "#{Location::API_URL}/#{ip}"
      response = HTTP.get url
      Parsers.parse response.to_s
    end
  end
end
