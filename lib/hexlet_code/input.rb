# frozen_string_literal: true

require_relative 'input_tags/text'
require_relative 'input_tags/input_element'

module HexletCode
  # input element
  class Input
    def initialize(name, hash, value)
      @name = name
      @hash = hash
      @value = value
    end

    def render
      if @hash.key?(:as)
        class_input = InputTags.const_get(@hash[:as].to_s.capitalize)
        class_input.build(@name, @value, @hash)
      else
        HexletCode::InputTags::InputElement.build(@name, @value, @hash)
      end
    end
  end
end
