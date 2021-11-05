# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/user'
require_relative 'hexlet_code/form_fields'
require_relative 'hexlet_code/input'
require_relative 'hexlet_code/tag'

# main module
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def form_for(user, **hash)
    raise 'Required presence of block with form fields' unless block_given?

    form_fields = FormFields.new user
    yield form_fields
    inputs = form_fields.render
    path = hash[:url] || '#'
    Tag.build('form', action: path, method: 'post') { inputs }
  end
  module_function :form_for
end
