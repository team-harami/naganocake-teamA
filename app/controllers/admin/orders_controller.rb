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
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    status = order.status
    status.update
    redirect_to admin_order_path
    # 多分非同期
  end

  # ストロングパロメーターは必要か？
end
