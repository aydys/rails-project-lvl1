# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/user'
require_relative 'hexlet_code/form_field'

# main module
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def form_for(user, **hash)
    inputs = ''
    if block_given?
      form_fields = FormFields.new user
      yield form_fields
      inputs = form_fields.acc
    end
    path = hash[:url] || '#'
    "<form action=\"#{path}\" method=\"post\">#{inputs}</form>"
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
