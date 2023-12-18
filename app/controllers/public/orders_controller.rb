class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # @customer = Customer.find(params[:customer_id])
    # @address = Address.where(customer_id: params[:customer_id])
  end

  def confirm
    # @customer = Customer.find(params[:customer_id])
  end

  def create
    order = Order.new
    order.user_id = current_user.id
    order.save
    redirect_to thanks_orders_path
  end
  
  def thanks
  end

  def index
    # @customer = Customer.find(params[:customer_id])
    # @orders = Order.where(customer_id: @customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @details = OrderDetail.find(params[:id])
  end
end
