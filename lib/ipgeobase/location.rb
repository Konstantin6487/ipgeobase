# frozen_string_literal: true

require "http"
require "addressable/template"

module Ipgeobase
  # Location factory
  class Location
    API_URL = "http://ip-api.com"

    def build_url(ip, ext)
      template = Addressable::Template.new("#{Location::API_URL}{/segments*}")
      template.expand({ segments: [ext, ip] })
    end

    def lookup(ip, ext = "xml")
      return unless ext.equal? "xml"

      url = build_url ip, ext
      response = HTTP.get url
      Parsers.xml_parse response.to_s
    end
  end
end
