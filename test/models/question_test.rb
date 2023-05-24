require 'test_helper'
require 'simplecov'
SimpleCov.start

class QuestionTest < ActiveSupport::TestCase
  test "should have content" do
    question = questions(:one)
    assert_not_nil question.content
  end

  test "should belong to a product" do
    question = questions(:two)
    assert_not_nil question.product
  end

end

