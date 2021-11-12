# frozen_string_literal: true

class TagsTest < Minitest::Test
  def test_method_that_creates_void_elements
    void_element = HexletCode::Tag.build('br')
    void_element_with_attribute = HexletCode::Tag.build('img', src: 'path/to/image')
    void_element_with_attributes = HexletCode::Tag.build('input', type: 'submit', value: 'Save')

    assert_equal(Fixture::HTML_TAGS[:br], void_element)
    assert_equal(Fixture::HTML_TAGS[:img], void_element_with_attribute)
    assert_equal(Fixture::HTML_TAGS[:input], void_element_with_attributes)
  end

  def test_exception_when_received_block_to_void_elements
    assert_raises(RuntimeError) do
      HexletCode::Tag.build('br') { 'something' }
    end
  end

  def test_method_that_creates_element_with_closing_tag
    element = HexletCode::Tag.build('label') { 'Email' }
    element_with_attribute = HexletCode::Tag.build('label', for: 'email') { 'Email' }

    assert_equal(Fixture::HTML_TAGS[:label], element)
    assert_equal(Fixture::HTML_TAGS[:label_with_attribute], element_with_attribute)
  end

  def test_method_that_creates_form_with_input
    element = HexletCode::Tag.build('form', action: '#', method: 'post') do
      HexletCode::Tag.build('label', for: 'name') { 'Name' } +
        HexletCode::Tag.build('input', name: 'name', type: 'text', value: 'rob')
    end
    expectation = Fixture::FORMS[:form]

    assert_equal(expectation, element)
  end

  def test_method_that_creates_form_with_input_with_actions
    element = HexletCode::Tag.build('form', action: '/users', method: 'post') do
      HexletCode::Tag.build('label', for: 'name') { 'Name' } +
        HexletCode::Tag.build('input', name: 'name', type: 'text', value: 'rob')
    end
    expectation = Fixture::FORMS[:form_with_action]

    assert_equal(expectation, element)
  end
end
