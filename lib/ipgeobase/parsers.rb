# frozen_string_literal: true

require "happymapper"

module Ipgeobase
  # Parsers
  class Parsers
    def self.xml_parse(raw)
      Address.parse raw, single: true
    end
  end
end
