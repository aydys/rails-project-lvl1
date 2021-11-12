# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class BaseInput
      attr_accessor :attributes

      def initialize(name, options)
        filtered_options = options.except(:as)
        @attributes = { name: name, **filtered_options }
      end
    end
  end
end
