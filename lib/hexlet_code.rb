# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/user'

# main module
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def form_for(_user, **hash)
    path = hash[:url] || '#'
    "<form action=\"#{path}\" method=\"post\"></form>"
  end
  module_function :form_for

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
