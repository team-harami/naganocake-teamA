class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items =  CartItem.where(customer_id: current_customer.id)
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.amount == nil
      redirect_to request.referer
    
    elsif cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: @cart_item.item_id)
      # ３０個を超えた場合数量が反映されない
      new_amount = check_amount(cart_item.amount + @cart_item.amount)
      cart_item.update_attribute(:amount, new_amount)
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer  
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer  
  end
  
  def destroy_all
    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.destroy_all
    redirect_to request.referer
  end
  
private

    def cart_item_params
        params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end

    def check_amount(amount)
      if amount > 30
         amount = 30
      else
        return amount
      end
    end
end
