# frozen_string_literal: true

require_relative '../tag'
require_relative './base_input'

# namespace for inputs
module HexletCode
  module InputTags
    # created input element
    class InputElement < BaseInput
      def self.build(name, value, attributes)
        super(name)
        attributes[:name] = @name
        attributes[:type] ||= 'text'
        attributes[:value] = value
        HexletCode::Tag.build('input', **attributes)
      end
    end
  end
end
