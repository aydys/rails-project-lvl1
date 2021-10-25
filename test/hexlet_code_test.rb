# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

class HexletCodeTest < Minitest::Test
  def setup
    @user = HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_created_form
    form = HexletCode.form_for @user
    form_with_link = HexletCode.form_for @user, url: '/users'

    assert_equal(form, '<form action="#" method="post"></form>')
    assert_equal(form_with_link, '<form action="/users" method="post"></form>')
  end

  def test_that_created_form_with_input
    form = HexletCode.form_for @user do |f|
      f.input :name
    end

    assert_equal(
      form,
      '<form action="#" method="post">'\
      '<label for="name">Name</label><input name="name" type="text" value="rob">'\
      '</form>'
    )
  end

  def test_that_created_input_with_options
    form = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-name'
    end

    assert_equal(
      form,
      '<form action="#" method="post">'\
      '<label for="name">Name</label><input class="user-name" name="name" type="text" value="rob">'\
      '</form>'
    )
  end

  def test_that_created_form_with_textarea
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal(
      form,
      '<form action="#" method="post">'\
      '<label for="job">Job</label><textarea cols="20" rows="40" name="job">hexlet</textarea>'\
      '</form>'
    )
  end

  def test_that_created_textarea_with_options
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text, cols: 50, rows: 50
    end

    assert_equal(
      form,
      '<form action="#" method="post">'\
      '<label for="job">Job</label><textarea cols="50" rows="50" name="job">hexlet</textarea>'\
      '</form>'
    )
  end

  def test_exception_when_field_not_match
    assert_raises(NameError) do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end
    end
  end

  def test_that_created_submit_button
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.submit 'Send'
    end

    assert_equal(
      form,
      '<form action="#" method="post"><label for="name">Name</label><input name="name" type="text" value="rob">'\
      '<input name="commit" type="submit" value="Send">'\
      '</form>'
    )
  end
end
