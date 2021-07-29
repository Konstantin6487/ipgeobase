# frozen_string_literal: true

require "http"
require "addressable/template"

module Ipgeobase
  # Location factory
  class Location
    API_URL = "http://ip-api.com"

    def build_url(ip)
      template = Addressable::Template.new("#{Location::API_URL}{/segments*}")
      template.expand({ segments: ["xml", ip] })
    end

    def lookup(ip)
      url = build_url ip
      response = HTTP.get url
      Parsers.parse response
    end
  end
end
