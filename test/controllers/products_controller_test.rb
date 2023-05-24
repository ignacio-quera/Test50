require "test_helper"
require 'simplecov'
SimpleCov.start

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    fixtures :products
    @product_one = products(:one)
    @product_two = products(:two)
  end
  
  test "should get index" do
    get products_index_url
    assert_response :success
  end

  test "should get show" do
    get products_show_url
    assert_response :success
  end

  #test "should create product" do
  #  assert_difference('Product.count') do
  #    post :create, params: { product: { name: @product_one.name, image: @product_one.image, category: @product_one.category, price: @product_one.price, description: @product_one.description } }
  #  end
  #  
  #  assert_redirected_to product_path(assigns(:product))
  #  # Realiza aserciones adicionales según tus requerimientos
  #end
end
