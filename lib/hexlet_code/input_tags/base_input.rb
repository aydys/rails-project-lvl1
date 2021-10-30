# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class BaseInput
      def self.build(name)
        @name = name
      end
    end
  end
end
