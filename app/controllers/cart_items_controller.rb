class CartItemsController < ApplicationController
  
  
  def index
    @cart_items = CartItem.all
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = 1
    # まだ会員のモデルと紐づけていないためコメントアウト
    # @cart_item.customer_id = current_user.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def destroy_all
    
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
  
end
