# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  # create a html element
  module Tag
    def build(tag_name, **hash)
      attributes = hash.each_with_object(+'') do |(key, value), acc|
        acc << " #{key}=\"#{value}\""
      end
      if block_given?
        "<#{tag_name}#{attributes}>#{yield}</#{tag_name}>"
      else
        "<#{tag_name}#{attributes}>"
      end
    end
    module_function :build
  end
end
