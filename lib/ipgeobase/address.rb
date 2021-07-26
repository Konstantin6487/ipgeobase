# frozen_string_literal: true

require "happymapper"

module Ipgeobase
  class Address
    include HappyMapper
    tag "query"
    element :city, String
    element :country, String
    element :countryCode, String
    element :lat, String
    element :lon, String
  end
end
