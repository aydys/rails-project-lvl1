# frozen_string_literal: true

module HexletCode
  # typing render form
  module RenderType
    private

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
  end
end
