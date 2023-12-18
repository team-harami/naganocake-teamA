class Public::AddressesController < ApplicationController
  
  def create
    address = Address.new(address_params)
    address.save
    render :index
  end
  
  def index
    @address = Address.new
    @customer = Customer.find(params[:customer_id])
    @addresses = Address.where(customer_id: @customer)
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end

end
