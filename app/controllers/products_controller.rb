class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:edit, :destroy]
  before_action :set_url_options, only: [:show]
  @categories = Product.pluck(:category).uniq
  
  def index
    if params[:category].present? && params[:category] != "All"
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
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
      flash.now[:error] = "Hubo errores al crear el producto."
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
      flash.now[:error] = "Hubo errores al editar el producto."
      render :edit
    end
  end

  def solicitar
    @product = Product.find(params[:id])
    @solicitud = Solicitud.new(nombre_producto: @product.name)
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
