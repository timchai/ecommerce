class ProductsController < ApplicationController

  def index
    if params[:view] == "discounted"
      @products = Product.where("price < ?", 50)
    elsif params[:view] == "ascending_sort"
      @products = Product.order(:price)
    elsif params[:view] == "descending_sort"
      @products = Product.order(price: :desc)  
    else
      @products = Product.all
    end 
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    @product = Product.create(item: params[:item], description: params[:description], size: params[:size], price: params[:price], image: params[:image])
    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  #def show
    #@product = Product.find_by(id: params[:id])
  #end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(item: params[:item], description: params[:description], size: params[:size], price: params[:price], image: params[:image])
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
    @products = Product.where("item LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end
end
