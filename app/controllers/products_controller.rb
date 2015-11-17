class ProductsController < ApplicationController

  def index
    if params[:view] == "discounted"
      @products = Product.where("price < ?", 50)
    else
      @products = Product.all
    end
  end

  def new
  end

  def new_product
  end

  def product_result

    Product.create(item: params[:item], description: params[:description], size: params[:size], price: params[:price])
  end

  def create
    item = params[:item]
    description = params[:description]
    size = params[:size]
    price = params[:price]
    image = params[:image]
    @product = Product.create(item: item, description: description, size: size, price: price, image: image)
    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def edit
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def update
    id = params[:id]
    @product = Product.find_by(id: id)
    
    item = params[:item]
    description = params[:description]
    size = params[:size]
    price = params[:price]
    image = params[:image]
    @product.update(item: item, description: description, size: size, price: price, image: image)
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    id = params[:id]
    product = Product.find_by(id: id)
    product.destroy
    flash[:success] = "Product Deleted"
    redirect_to "/products"
  end

end
