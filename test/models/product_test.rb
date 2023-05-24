require 'test_helper'
require 'simplecov'
SimpleCov.start

class ProductTest < ActiveSupport::TestCase
  def setup
    fixtures :products
    @product_one = products(:one)
    @product_two = products(:two)
  end

  test "should be valid" do
    assert @product_one.valid?
  end

  test "name should be present" do
    @product_one.name = ""
    assert_not @product_one.valid?
  end

  test "image should be present" do
    @product_one.image = ""
    assert_not @product_one.valid?
  end

  #test "category should be present" do
  #  puts ' '
  #end

  #test "price should be present" do
  
  #end

  #test "description should be present" do
  #  @product_one.description = ""
  #  assert_not @product_one.valid?
  #end

  #test "price should be a positive number" do
   
  #end
end

