class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @address = @customer.addresses
  end

  def confirm
    @customer = current_customer
    # order = Order.find(params[:id])
    # @pay = order.payment_method
    #newページで登録した情報を反映させたい 
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
    @order = Order.find(params[:id])
    @details = OrderDetail.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end

end
