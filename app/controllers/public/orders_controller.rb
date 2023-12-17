class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # @customer = Customer.find(params[:customer_id])
    # @address = Address.where(customer_id: params[:customer_id])
  end

  def confirm
    @customer = Customer.find(params[:customer_id])
    if current_user == @customer
      
  end

  def thanks
  end

  def create
    @order = Order.new
    @order.save
    redirect_to 
  end

  def index
  end

  def show
  end
end
