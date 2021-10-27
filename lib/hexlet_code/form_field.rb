# frozen_string_literal: true

module HexletCode
  # creates inputs, textarea
  class FormFields
    def initialize(user)
      @user = user
      @acc = []
    end

    def input(name, **hash)
      @user.public_send(name)
      label = Tag.new 'label', { for: name }, -> { name.capitalize }
      @acc << label
      input = Input.new(name, hash, @user[name])
      @acc << input
    end

    def submit(value = 'Save')
      element = Tag.new 'input', { name: 'commit', type: 'submit', value: value }, nil
      @acc << element
    end

    def render
      @acc.each_with_object(+'').each { |elem, acc| acc << elem.render }
    end
  end
end
