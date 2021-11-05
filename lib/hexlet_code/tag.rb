# frozen_string_literal: true

require_relative 'tag_renderer'

module HexletCode
  # create a html element
  class Tag
    attr_reader :tag_name, :attributes, :block

    def initialize(tag_name, attributes, block)
      @tag_name = tag_name
      @attributes = attributes
      @block = block
    end

    def self.build(tag_name, **attributes, &block)
      tag = new tag_name, attributes, block
      TagRenderer.render(tag)
    end
  end
end
