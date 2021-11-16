# frozen_string_literal: true

require_relative 'input_tags/text_input'
require_relative 'input_tags/string_input'

module HexletCode
  # input element
  class Input
    def initialize(name, options, value)
      @name = name
      @options = options
      @value = value
    end

    def render
      @options[:as] ||= 'string'
      input_type = "#{@options[:as].to_s.capitalize}Input"
      class_input = InputTags.const_get(input_type)
      class_input.build(@name, @value, @options)
    end
  end
end
