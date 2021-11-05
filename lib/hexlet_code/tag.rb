# frozen_string_literal: true

require_relative 'tag_renderer'

module HexletCode
  # create a html element
  class Tag
    include TagRenderer

    def initialize(tag_name, hash, block)
      @tag_name = tag_name
      @attributes = hash
      @block = block
    end

    def render
      render_html
    end

    def self.build(tag_name, **hash, &block)
      element = new tag_name, hash, block
      element.render
    end
  end
end
