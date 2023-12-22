class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @address = @customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    # 配達先を登録していなければエラー
    # @address = Address.find(params[:order][:address_id])
    @customer = current_customer
    @select_address = params[:order][:address_option]
    @pay = params[:order][:payment_method]
    
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_item.each do |item|
      @total_price += item.subtotal
    end
    @order.shipping_cost = '800'
    @order.total_payment = @total_price + 800
  end

  def create
    order = Order.new(order_params)
    order.user_id = current_user.id
    order.save
    redirect_to thanks_orders_path
  end

  def thanks
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: @customer.id)
  end

  def show
    @order = Order.find(params[:order_id])
    @details = OrderDetail.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment, :customer_id)
  end

end
