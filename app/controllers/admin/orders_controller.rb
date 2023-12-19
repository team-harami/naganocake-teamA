class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
    @customer = Customer.find(params[:customer_id])
  end

  def show
    @customer = Customer.find(params[:customer_id])
    # @customer_id = @customer.id
    # @order = Order.customer_id
    # ↑分からん
    @order = Order.find(params[:order_])
  end

  def update
  end
end
