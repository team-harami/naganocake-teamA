class Public::AddressesController < ApplicationController

  def create
    address = Address.new(address_params)
    address.save
    render :index
  end

  def index
    @address = Address.new
    # @customer = Customer.find(params[:customer_id])
    # @addresses = Address.where(customer_id: @customer)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
