# frozen_string_literal: true

module HexletCode
  # typing render form
  module TagRenderer
    def render(tag)
      tag_name = tag.tag_name
      attributes = tag.attributes
      block = tag.block
      render_html(tag_name, attributes, block)
    end
    module_function :render

    private

    def render_html(tag_name, attributes, block)
      attributes_acc = attributes.each_with_object(+'') do |(key, value), acc|
        acc << " #{key}=\"#{value}\""
      end
      if block
        "<#{tag_name}#{attributes_acc}>#{block.call}</#{tag_name}>"
      else
        "<#{tag_name}#{attributes_acc}>"
      end
    end
    module_function :render_html
  end
end
