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

    assert(void_element == '<br>')
    assert(void_element_with_attribute == '<img src="path/to/image">')
    assert(void_element_with_attributes == '<input type="submit" value="Save">')
  end

  def test_method_that_creates_element_with_closing_tag
    element = HexletCode::Tag.build('label') { 'Email' }
    element_with_attribute = HexletCode::Tag.build('label', for: 'email') { 'Email' }

    assert(element == '<label>Email</label>')
    assert(element_with_attribute == '<label for="email">Email</label>')
  end
end
