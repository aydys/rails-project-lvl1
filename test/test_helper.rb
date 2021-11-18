# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'
require_relative 'fixtures/user'

require 'minitest/autorun'

def load_fixture(filename)
  File.read("#{__dir__}/fixtures/#{filename}").delete("\n")
end
