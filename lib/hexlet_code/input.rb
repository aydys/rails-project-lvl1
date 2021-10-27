# frozen_string_literal: true

require_relative 'input_tags/textarea'
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
        case @hash[:as]
        when :text then HexletCode::InputTags::Textarea.build(@name, @value, @hash)
        else
          raise ArgumentError, "Wrong type of input: #{@hash[:as]}"
        end
      else
        HexletCode::InputTags::InputElement.build(@name, @value, @hash)
      end
    end
  end
end
