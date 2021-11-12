# frozen_string_literal: true

module Fixture
  FORMS = {
    form: '<form action="#" method="post">' \
          '<label for="name">Name</label>' \
          '<input name="name" type="text" value="rob">' \
          '</form>',
    form_with_action: '<form action="/users" method="post">' \
                      '<label for="name">Name</label>' \
                      '<input name="name" type="text" value="rob">' \
                      '</form>',
    form_with_input: '<form action="#" method="post">'\
                     '<label for="name">Name</label>' \
                     '<input class="user-name" name="name" type="text" value="rob">'\
                     '</form>',
    form_with_textarea: '<form action="#" method="post">' \
                        '<label for="job">Job</label>' \
                        '<textarea name="job" cols="20" rows="40">hexlet</textarea>' \
                        '</form>',
    form_textarea_with_options: '<form action="#" method="post">' \
                                '<label for="job">Job</label>' \
                                '<textarea name="job" cols="50" rows="50">hexlet</textarea>' \
                                '</form>',
    form_with_submit_button: '<form action="#" method="post">' \
                             '<label for="name">Name</label>' \
                             '<input name="name" type="text" value="rob">'\
                             '<input name="commit" type="submit" value="Send">'\
                             '</form>'
  }.freeze
end
