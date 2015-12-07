class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]
 # before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
 
  def index
    @categories = Category.all
    if params[:view] == "discounted"
      @products = Product.where("price < ?", 50)
    elsif params[:view] == "ascending_sort"
      @products = Product.order(:price)
    elsif params[:view] == "descending_sort"
      @products = Product.order(price: :desc) 
    elsif params[:category] 
      @products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end 
  end

  def show
    @carted_product = CartedProduct.new
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
  #  if current_user && current_user.admin?
    @product = Product.new
    @product.images.build
  #  else
  #    redirect_to "/"
  #  end
  end

  def create
    @product = Product.new(product_params)
   # @product = Product.new(id: params[:id], item: params[:item], description: params[:description], size: params[:size], price: params[:price], user_id: current_user.id, supplier_id: params[:suppler][:supplier_id])
    if @product.save
      flash[:success] = "Product Created"
      redirect_to "/products/#{@product.id}"
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    #@product.update(id: params[:id], item: params[:item], description: params[:description], size: params[:size], price: params[:price])
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:success] = "Product Deleted"
    redirect_to "/products"
  end

  def search
    search_term = params[:search]
    @products = Product.where("item ILIKE ? OR description ILIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end

  private

  def product_params
    params.require(:product).permit(:id, :item, :description, :size, :price, :supplier_id, images_attributes: [:image_url])
  end
end
