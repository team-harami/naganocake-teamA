class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
      if @order_detail.update(order_detail_params)
         @order.update(status: "製作中") if @order_detail.making_status == "製作中"
         @order_details.each do |order_detail|
           if order_detail.making_status != "製作完了"
             is_updated = false
           end
         end
         @order.update(status: "発送準備中") if is_updated
      end
    # order_detail.update(order_detail_params)
     redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :tax_price, :amount, :making_status)
  end
end
