require 'test_helper'
require 'simplecov'
SimpleCov.start

class AnswersHelperTest < ActionView::TestCase
  test "format_answer should return formatted answer" do
    answer = answers(:one)
    formatted_answer = format_answer(answer.content)

    assert_equal "<p>This is answer one.</p>\n", formatted_answer
  end

  #test "format_answer should handle empty answer" do
  #  puts ' '
  #end
  #
  #test "highlight_keywords should highlight keywords in answer" do
  #  answer = answers(:one)
  #  keywords = %w(answer one)
  #
  #  highlighted_answer = highlight_keywords(answer.content, keywords)
  #
  #  expected_answer = "This is <strong>answer</strong> <strong>one</strong>."
  #  assert_equal expected_answer, highlighted_answer
  #end

  #test "highlight_keywords should handle empty answer" do
  #  puts ' '
  #end
end
