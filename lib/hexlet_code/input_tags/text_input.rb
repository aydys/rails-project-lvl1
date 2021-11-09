# frozen_string_literal: true

require_relative '../tag'
require_relative './base_input'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class TextInput < BaseInput
      def initialize(name)
        super(name)
        @attributes[:cols] = '20'
        @attributes[:rows] = '40'
      end

      def self.build(name, value, options)
        init_attributes = new(name).attributes
        attributes = options.except(:as)
        final_attributes = init_attributes.merge(attributes)
        HexletCode::Tag.build('textarea', **final_attributes) { value }
      end
    end
  end
end
