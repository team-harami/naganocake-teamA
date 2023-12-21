class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @address = @customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @customer = current_customer
    @select_address = params[:order][:address_option]
    # order = Order.find(params[:id])
    @pay = params[:order][:payment_method]
    #newページで登録した情報を反映させたい
    # @order.postal_code = @address.postal_code
    # @order.address = @address.address
    # @order.name = @address.name
    # @option = @order.address_option
    # @order = Address.new
    # @order = params[:order][:address_option][2]
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    # @item_id = cart_item.item_id
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
    params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end

end
