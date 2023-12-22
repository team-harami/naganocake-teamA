class Public::AddressesController < ApplicationController

  # def new
  #   address = Address.new
  # end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to addresses_path
  end

  def index
    @address = Address.new
    # @customer = Customer.find(params[:customer_id])
    # @address.customer_id = current_customer.id
    # @customer = current_customer.id
    @addresses = Address.where(customer_id: current_customer.id)
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
