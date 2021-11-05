# frozen_string_literal: true

require_relative 'input_tags/text'
require_relative 'input_tags/input_element'

module HexletCode
  # input element
  class Input
    def initialize(name, options, value)
      @name = name
      @options = options
      @value = value
    end

    def render
      if @options.key?(:as)
        class_input = InputTags.const_get(@options[:as].to_s.capitalize)
        class_input.build(@name, @value, @options)
      else
        HexletCode::InputTags::InputElement.build(@name, @value, @options)
      end
    end
  end
end
