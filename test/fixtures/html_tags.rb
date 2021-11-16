# frozen_string_literal: true

module Fixture
  FORMS = {
    form: File.read("#{__dir__}/form.html").delete("\n"),
    form_with_action: File.read("#{__dir__}/form_with_action.html").delete("\n"),
    form_with_input: File.read("#{__dir__}/form_with_input.html").delete("\n"),
    form_with_textarea: File.read("#{__dir__}/form_with_textarea.html").delete("\n"),
    form_textarea_with_options: File.read("#{__dir__}/form_textarea_with_option.html").delete("\n"),
    form_with_submit_button: File.read("#{__dir__}/form_with_submit_button.html").delete("\n")
  }.freeze
end
