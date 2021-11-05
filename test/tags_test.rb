# frozen_string_literal: true

class TagsTest < Minitest::Test
  def test_method_that_creates_void_elements
    void_element = HexletCode::Tag.build('br')
    void_element_with_attribute = HexletCode::Tag.build('img', src: 'path/to/image')
    void_element_with_attributes = HexletCode::Tag.build('input', type: 'submit', value: 'Save')

    assert_equal('<br>', void_element)
    assert_equal('<img src="path/to/image">', void_element_with_attribute)
    assert_equal('<input type="submit" value="Save">', void_element_with_attributes)
  end

  def test_method_that_creates_element_with_closing_tag
    element = HexletCode::Tag.build('label') { 'Email' }
    element_with_attribute = HexletCode::Tag.build('label', for: 'email') { 'Email' }

    assert_equal('<label>Email</label>', element)
    assert_equal('<label for="email">Email</label>', element_with_attribute)
  end

  def test_method_that_creates_form_with_input
    element = HexletCode::Tag.build('form', action: '#', method: 'post') do
      HexletCode::Tag.build('label', for: 'name') { 'Name' } +
        HexletCode::Tag.build('input', name: 'name', type: 'text', value: 'rob')
    end
    expectation = '<form action="#" method="post">' \
      '<label for="name">Name</label>' \
      '<input name="name" type="text" value="rob">' \
    '</form>'

    assert_equal(expectation, element)
  end

  def test_method_that_creates_form_with_input_with_actions
    element = HexletCode::Tag.build('form', action: '/users', method: 'post') do
      HexletCode::Tag.build('label', for: 'name') { 'Name' } +
        HexletCode::Tag.build('input', name: 'name', type: 'text', value: 'rob')
    end
    expectation = '<form action="/users" method="post">' \
      '<label for="name">Name</label>' \
      '<input name="name" type="text" value="rob">' \
    '</form>'

    assert_equal(expectation, element)
  end
end
