# frozen_string_literal: true

require_relative '../tag'
require_relative './base_input'

# namespace for inputs
module HexletCode
  module InputTags
    # created input element
    class FormInput < BaseInput
      def initialize(name, options)
        super
        @attributes[:type] = 'text'
        @attributes = @attributes.sort.to_h
      end

      def self.build(name, value, options)
        attributes = new(name, options).attributes
        attributes[:value] = value
        HexletCode::Tag.build('input', **attributes)
      end
    end
  end
end
