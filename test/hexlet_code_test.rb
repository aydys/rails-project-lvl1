# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    @user = Fixture::User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_created_form_with_input
    form = HexletCode.form_for @user do |f|
      f.input :name
    end
    expectation = load_fixture('form.html')

    assert_equal(expectation, form)
  end

  def test_that_created_input_with_options
    form = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-name'
    end
    expectation = load_fixture('form_with_input.html')

    assert_equal(expectation, form)
  end

  def test_that_created_form_with_textarea
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end
    expectation = load_fixture('form_with_textarea.html')

    assert_equal(expectation, form)
  end

  def test_that_created_textarea_with_options
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text, cols: 50, rows: 50
    end
    expectation = load_fixture('form_textarea_with_option.html')

    assert_equal(expectation, form)
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
    expectation = load_fixture('form_with_submit_button.html')

    assert_equal(expectation, form)
  end

  def test_exception_when_created_form_without_fields
    assert_raises(RuntimeError) do
      HexletCode.form_for @user, url: '/users'
    end
  end
end
