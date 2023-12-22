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
    @pay = params[:order][:payment_method]
    
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_item.each do |item|
      @total_price += item.subtotal
    end
    # @order.shipping_cost = '800'
    @order.total_payment = @total_price + 800
    @order_new = Order.new
    render :confirm
  end

  def create
    order = Order.new(order_params)
    # order.user_id = current_user.id
    order.save
    @cart_items = current_customer.cart_items.all
    
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.tax_price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save!
    end
    
    CartItem.destroy_all
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
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment, :customer_id, :status)
  end
  
  def cartitem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
    end
  end

end
