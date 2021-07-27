# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ipgeobase"

require "minitest/autorun"
require "webmock/minitest"
require "ox"
require "addressable/template"

WebMock.disable_net_connect!

def build_url(api_url, ip:, ext:)
  template = Addressable::Template.new "#{api_url}{/segments*}"
  template.expand({ segments: [ext || "xml", ip] })
end

def run_stub(url, method:, body:)
  stub_request(method, url).to_return(body: body)
end

def read_fixture_file(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
end
