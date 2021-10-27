# frozen_string_literal: true

require_relative '../tag'

# namespace for inputs

module HexletCode
  module InputTags
    # created input element
    class InputElement
      def self.build(name, value, hash)
        hash[:name] = name
        hash[:type] ||= 'text'
        hash[:value] = value
        HexletCode::Tag.build('input', **hash)
      end
    end
  end
end
