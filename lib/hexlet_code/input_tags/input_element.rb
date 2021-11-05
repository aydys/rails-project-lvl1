# frozen_string_literal: true

require_relative '../tag'
require_relative './base_input'

# namespace for inputs
module HexletCode
  module InputTags
    # created input element
    class InputElement < BaseInput
      def initialize(name)
        super(name)
        @attributes[:type] = 'text'
      end

      def self.build(name, value, attributes)
        initial_attributes = new(name).attributes
        initial_attributes[:value] = value
        final_attributes = attributes.merge(initial_attributes)
        HexletCode::Tag.build('input', **final_attributes)
      end
    end
  end
end
