class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    authorize! :create, Product
    @product = Product.create
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Producto eliminado"
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :category, :description, :price, :image)
  end
end
