# frozen_string_literal: true

module HexletCode
  # common element
  class Element
    def initialize(tag_name, hash, block)
      @tag_name = tag_name
      @hash = hash
      @block = block
    end

    def render_html
      attributes = @hash.each_with_object(+'') do |(key, value), acc|
        acc << " #{key}=\"#{value}\""
      end
      if @block
        "<#{@tag_name}#{attributes}>#{@block.call}</#{@tag_name}>"
      else
        "<#{@tag_name}#{attributes}>"
      end
    end

    def render
      render_html
    end
  end
end
