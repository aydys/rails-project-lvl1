# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class BaseInput
      attr_accessor :attributes

      def initialize(name)
        @attributes = { name: name }
      end
    end
  end
end
