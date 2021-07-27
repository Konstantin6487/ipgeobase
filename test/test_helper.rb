# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ipgeobase"

require "minitest/autorun"
require "webmock/minitest"
require "ox"
require "addressable/template"

WebMock.disable_net_connect!

def read_fixture_file(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
end
