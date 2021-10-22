# frozen_string_literal: true

module HexletCode
  # creates inputs, textarea
  class FormFields
    attr_reader :acc

    def initialize(user)
      @user = user
      @acc = +''
    end

    def input(name, **hash)
      @user.public_send(name)
      @acc << if hash.key? :as
                "<textarea cols=\"20\" rows=\"40\" name=\"#{name}\">#{@user[name]}</textarea>"
              else
                "<input name=\"#{name}\" type=\"text\" value=\"#{@user[name]}\">"
              end
    end
  end
end
