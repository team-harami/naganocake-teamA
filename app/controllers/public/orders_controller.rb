class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    # @address = @customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @select_address = params[:order][:address_option]
    if @select_address == '0'
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    elsif @select_address == '1'
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif @select_address == '2'
      @order.customer_id = current_customer.id
    end
    # @address = Address.find(params[:order][:address_id])
    # @customer = current_customer
    # @select_address = params[:order][:address_option]
    # @pay = params[:order][:payment_method]

    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_item.each do |item|
      @total_price += item.subtotal
    end
    # @order.shipping_cost = '800'
    @order.total_payment = @total_price + 800
    @order_new = Order.new
  end

  def create
    order = Order.new(order_params)
    # order.status = value: 0
    # order.user_id = current_user.id
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.tax_price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.making_status = '製作不可'
      @order_details.save
    end

    CartItem.destroy_all
    redirect_to thanks_orders_path
  end

  def thanks
  end

  def index
    # @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: current_customer.id)
    @date_format = "%Y/%m/%d"
  end

  def show
    @order = Order.find(params[:id])
    @details = OrderDetail.where(order_id: @order)
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_item.each do |item|
      @total_price += item.subtotal
    end
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
