# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/user'
require_relative 'hexlet_code/form_field'
require_relative 'hexlet_code/element'
require_relative 'hexlet_code/input'

# main module
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def form_for(user, **hash)
    inputs = ''
    if block_given?
      form_fields = FormFields.new user
      yield form_fields
      inputs = form_fields.render
    end
    path = hash[:url] || '#'
    form_element = Element.new 'form', { action: path, method: 'post' }, -> { inputs }
    form_element.render
  end
  module_function :form_for

  # create a html element
  module Tag
    def build(tag_name, **hash, &block)
      element = HexletCode::Element.new tag_name, hash, block
      element.render
    end
    module_function :build
  end
end
