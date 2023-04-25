class ProductsController < ApplicationController
  def index
  end

  def new
    authorize! :create, Product
    @product = Product.new
  end
  

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Producto creado exitosamente."
    else
      render :new
    end
  end

  def filter_by_category
    @category = params[:category]
    @products = Product.where(category: @category)
    render 'index'
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :category, :description, :image)
  end
end
