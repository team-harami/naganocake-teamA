class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # @customer = Customer.find(params[:customer_id])
    # @address = Address.where(customer_id: params[:customer_id])
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
end
