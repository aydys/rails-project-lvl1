# frozen_string_literal: true

require_relative '../tag'
require_relative './base_input'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class TextInput < BaseInput
      def initialize(name, options)
        super
        @attributes[:cols] ||= '20'
        @attributes[:rows] ||= '40'
      end

      def self.build(name, value, options)
        attributes = new(name, options).attributes
        HexletCode::Tag.build('textarea', **attributes) { value }
      end
    end
  end
end
