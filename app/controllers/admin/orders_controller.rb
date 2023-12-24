class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    # @orders = Order.page(params[:page])
    # @orders = Order.order("id DESC")
    @orders = Order.order(created_at: :desc)
    @order_amount = 0
  end

  def show
    # @customer = Customer.find(params[:customer_id])
    # @order_show = @customer.cart_item(updated_at)
    # ↑改正する余地あり
    # @customer_id = @customer.id
    # @order = Order.customer_id
    # ↑分からん
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status: "製作待ち") if @order.status == "入金確認"
    end
                # status = order.status
    # @order.update(order_params)
    redirect_to request.referer
    # 多分非同期
  end

  private
  # ストロングパロメーターは必要か？
  def order_params
        params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
