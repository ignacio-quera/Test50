require 'test_helper'
require 'simplecov'
SimpleCov.start

class ProductsHelperTest < ActionView::TestCase
  test "display_product_name should return product name" do
    product = products(:one)
    displayed_name = display_product_name(product)

    assert_equal "Product One", displayed_name
  end

  test "display_product_price should return formatted price" do
    product = products(:two)
    displayed_price = display_product_price(product)

    assert_equal "$19.99", displayed_price
  end

  #test "display_product_description should return truncated description" do
    
  #end

  #test "display_product_image should return image tag" do
    
  #end
end
