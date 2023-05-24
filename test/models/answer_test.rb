require 'test_helper'
require 'simplecov'
SimpleCov.start

class AnswerTest < ActiveSupport::TestCase
  fixtures :answers

  test "should save answer" do
    answer = answers(:one)
    assert answer.save
  end

  test "should not save answer without content" do
    answer = answers(:two)
    answer.content = nil
    assert_not answer.save
  end
end

