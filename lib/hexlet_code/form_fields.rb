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
      label = Tag.build('label', for: name) { name.capitalize }
      @acc << label
      input = Input.new(name, hash, @user[name])
      @acc << input.render
    end

    def submit(value = 'Save')
      element = Tag.build('input', name: 'commit', type: 'submit', value: value)
      @acc << element
    end

    def render
      @acc.join
    end
  end
end
