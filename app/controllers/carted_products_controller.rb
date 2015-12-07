class CartedProductsController < ApplicationController
  def create 
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity]
    @carted_product = CartedProduct.new(quantity: quantity, product_id: @product.id, status: "Carted", user_id: current_user.id)
    if @carted_product.save
      session[:cart_count] += 1
      flash[:success] = "#{quantity} #{@product.item}(s) Drinks added to cart"
      redirect_to "/"
    else
      render template: "products/show"
    end
  end
    
  def index
    if current_user && current_user.carted_products.where(status: "Carted").any?
      @carted_products = current_user.carted_products.where(status: "Carted")
      @subtotal = calculate_subtotal(@carted_products)
      @tax = calculate_tax(@carted_products)
      @total = @subtotal + @tax
    else
      redirect_to '/'
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "Removed"
    if carted_product.save
      session[:cart_count] -= 1
      flash[:warning] = "#{carted_product.quantity} #{carted_product.product.item}(s) removed from cart."
    else
      flash[:danger] = "Product not removed from cart!"
    end
    redirect_to "/carted_products"
  end
end
