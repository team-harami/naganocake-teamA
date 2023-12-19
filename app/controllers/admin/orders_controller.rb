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
  end

  def update
  end
end
