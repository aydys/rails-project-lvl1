# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # namespace for inputs
  module InputTags
    # created textarea
    class Textarea
      def self.build(name, value, hash)
        hash.delete(:as)
        hash[:cols] ||= '20'
        hash[:rows] ||= '40'
        hash[:name] = name
        HexletCode::Tag.build('textarea', **hash) { value }
      end
    end
  end
end
