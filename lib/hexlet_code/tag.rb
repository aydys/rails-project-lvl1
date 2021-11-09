# frozen_string_literal: true

require_relative 'tag_renderer'

module HexletCode
  # create a html element
  class Tag
    @empty_elements = %w[area base br col embed hr img input keygen link meta param source track wbr]
    attr_reader :tag_name, :attributes, :block

    def initialize(tag_name, attributes, block)
      @tag_name = tag_name
      @attributes = attributes
      @block = block
    end

    def self.build(tag_name, **attributes, &block)
      is_invalid_tag = @empty_elements.include?(tag_name) && block_given?
      raise "Invalid tag name: #{tag_name}" if is_invalid_tag

      tag = new tag_name, attributes, block
      TagRenderer.render(tag)
    end
  end
end
