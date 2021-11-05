# frozen_string_literal: true

module HexletCode
  # typing render form
  module TagRenderer
    private

    def render_html
      attributes_acc = @attributes.each_with_object(+'') do |(key, value), acc|
        acc << " #{key}=\"#{value}\""
      end
      if @block
        "<#{@tag_name}#{attributes_acc}>#{@block.call}</#{@tag_name}>"
      else
        "<#{@tag_name}#{attributes_acc}>"
      end
    end
  end
end
