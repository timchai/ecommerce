class SuppliersController < ApplicationController
  
  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(user_params)
    if @supplier.save
      redirect_to "/suppliers/#{@supplier.id}"
    else
      render :new
    end
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

  def edit 
    @supplier = Supplier.find_by(id: params[:id])
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    if @supplier.update(user_params)
      redirect_to "/supplier/#{@supplier.id}"
    else
      render :edit
    end
  end

  def destroy
    Supplier.find_by(id: params[:id]).update(active: false)
    redirect_to "/suppliers"
  end

  private

  def user_params
    params.require(:supplier).permit(:name, :email, :phone)
  end

end
