# frozen_string_literal: true

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
        when :text then render_textarea
        else
          raise ArgumentError, "Wrong type of input: #{@hash[:as]}"
        end
      else
        render_input
      end
    end

    private

    def render_textarea
      @hash.delete(:as)
      @hash[:cols] ||= '20'
      @hash[:rows] ||= '40'
      @hash[:name] = @name
      Tag.build('textarea', **@hash) { @value }
    end

    def render_input
      @hash[:name] = @name
      @hash[:type] ||= 'text'
      @hash[:value] = @value
      Tag.build('input', **@hash)
    end
  end
end