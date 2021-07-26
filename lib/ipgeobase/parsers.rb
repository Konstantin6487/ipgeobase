# frozen_string_literal: true

module Ipgeobase
  # XML parser
  class Parsers
    def self.parse(raw)
      Address.parse(raw, single: true)
    end
  end
end
