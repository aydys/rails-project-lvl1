# frozen_string_literal: true

require_relative '../render_type/render_type'

module HexletCode
  # create a html element
  class Tag
    include RenderType

    def initialize(tag_name, hash, block)
      @tag_name = tag_name
      @hash = hash
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
