# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form_fields'
require_relative 'hexlet_code/input'
require_relative 'hexlet_code/tag'

# main module
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def form_for(entity, **attributes)
    raise 'Required presence of block with form fields' unless block_given?

    form_fields = FormFields.new entity
    yield form_fields
    inputs = form_fields.render
    path = attributes[:url] || '#'
    Tag.build('form', action: path, method: 'post') { inputs }
  end
  module_function :form_for
end
