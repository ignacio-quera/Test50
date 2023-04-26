class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:edit, :destroy]
  before_action :set_url_options, only: [:show]
  
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Producto actualizado correctamente.'
    else
      render :edit
    end
  end

  def filter_by_category
    @category = params[:category]
    @products = Product.where(category: @category)
    render 'index'
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.admin?
      @product.destroy
      redirect_to products_url, notice: "El producto ha sido eliminado."
    else
      redirect_to products_url, alert: "Solo los administradores pueden eliminar productos."
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end
  
  
  private

  def product_params
    params.require(:product).permit(:name, :category, :description, :price, :image)
  end

  def authorize_admin
    redirect_to root_path, alert: "Solo los administradores pueden eliminar productos." unless current_user.admin?
  end

  def set_url_options
    ActiveStorage::Current.host = request.base_url
  end
end
