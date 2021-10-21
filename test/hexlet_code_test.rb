# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_method_that_creates_void_elements
    void_element = HexletCode::Tag.build('br')
    void_element_with_attribute = HexletCode::Tag.build('img', src: 'path/to/image')
    void_element_with_attributes = HexletCode::Tag.build('input', type: 'submit', value: 'Save')

    assert_equal(void_element, '<br>')
    assert_equal(void_element_with_attribute, '<img src="path/to/image">')
    assert_equal(void_element_with_attributes, '<input type="submit" value="Save">')
  end

  def test_method_that_creates_element_with_closing_tag
    element = HexletCode::Tag.build('label') { 'Email' }
    element_with_attribute = HexletCode::Tag.build('label', for: 'email') { 'Email' }

    assert_equal(element, '<label>Email</label>')
    assert_equal(element_with_attribute, '<label for="email">Email</label>')
  end

  def test_that_created_form
    user = HexletCode::User.new name: 'rob'
    form = HexletCode.form_for user
    form_with_link = HexletCode.form_for user, url: '/users'

    assert_equal(form, '<form action="#" method="post"></form>')
    assert_equal(form_with_link, '<form action="/users" method="post"></form>')
  end
end
