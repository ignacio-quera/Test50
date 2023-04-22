class ProductsController < ApplicationController
  def index
  end
  
  def filter_by_category
    @category = params[:category]
    @products = Product.where(category: @category)
    render 'index'
  end

  def show
  end
end
