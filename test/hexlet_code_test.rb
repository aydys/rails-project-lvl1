# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    @user = HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm'
    @tag = HexletCode::Tag
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_created_form
    form = HexletCode.form_for @user
    form_with_link = HexletCode.form_for @user, url: '/users'
    expectation = @tag.build('form', action: '#', method: 'post') {}
    expectation_with_link = @tag.build('form', action: '/users', method: 'post') {}

    assert_equal(expectation, form)
    assert_equal(expectation_with_link, form_with_link)
  end

  def test_that_created_form_with_input
    form = HexletCode.form_for @user do |f|
      f.input :name
    end
    expectation = @tag.build('form', action: '#', method: 'post') do
      @tag.build('label', for: 'name') { 'Name' } +
        @tag.build('input', name: 'name', type: 'text', value: 'rob')
    end

    assert_equal(expectation, form)
  end

  def test_that_created_input_with_options
    form = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-name'
    end
    expectation = @tag.build('form', action: '#', method: 'post') do
      @tag.build('label', for: 'name') { 'Name' } +
        @tag.build('input', class: 'user-name', name: 'name', type: 'text', value: 'rob')
    end

    assert_equal(expectation, form)
  end

  def test_that_created_form_with_textarea
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end
    expectation = @tag.build('form', action: '#', method: 'post') do
      @tag.build('label', for: 'job') { 'Job' } +
        @tag.build('textarea', cols: '20', rows: '40', name: 'job') { 'hexlet' }
    end

    assert_equal(expectation, form)
  end

  def test_that_created_textarea_with_options
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text, cols: 50, rows: 50
    end
    expectation = @tag.build('form', action: '#', method: 'post') do
      @tag.build('label', for: 'job') { 'Job' } +
        @tag.build('textarea', cols: '50', rows: '50', name: 'job') { 'hexlet' }
    end

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
    expectation = @tag.build('form', action: '#', method: 'post') do
      @tag.build('label', for: 'name') { 'Name' } +
        @tag.build('input', name: 'name', type: 'text', value: 'rob') +
        @tag.build('input', name: 'commit', type: 'submit', value: 'Send')
    end

    assert_equal(expectation, form)
  end
end
