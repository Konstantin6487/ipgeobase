# frozen_string_literal: true

require_relative "ipgeobase/version"

# main Module
module Ipgeobase
  autoload :Location, "ipgeobase/location"
  autoload :Parsers, "ipgeobase/parsers"
  autoload :Address, "ipgeobase/address"

  class Error < StandardError; end

  def self.lookup(ip)
    location = Location.new
    location.lookup ip
  end
end
