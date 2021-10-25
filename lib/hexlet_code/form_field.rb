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
      label = +"<label for=\"#{name}\">#{name.capitalize}</label>"
      @acc << if hash.key? :as
                "#{label}<textarea cols=\"20\" rows=\"40\" name=\"#{name}\">#{@user[name]}</textarea>"
              else
                "#{label}<input name=\"#{name}\" type=\"text\" value=\"#{@user[name]}\">"
              end
    end

    def submit(value = 'Save')
      @acc << "<input name=\"commit\" type=\"submit\" value=\"#{value}\">"
    end
  end
end
