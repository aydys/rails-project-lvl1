# frozen_string_literal: true

require_relative '../tag'
require_relative './base_input'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class Text < BaseInput
      def self.build(name, value, hash)
        super(name)
        attributes = hash.except(:as)
        attributes[:cols] ||= '20'
        attributes[:rows] ||= '40'
        attributes[:name] = @name
        HexletCode::Tag.build('textarea', **attributes) { value }
      end
    end
  end
end
