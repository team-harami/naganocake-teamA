class Admin::ItemsController < ApplicationController
    
    
    
    def index
    
    end
    
    def new
        @item = Item.new
        
    end
    
    def create
        @item = Item.new
        @item.save
        # 後でパス先を商品詳細に変更する
        redirect_to new_admin_item_path
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    private
    
    # ストロングパラメーター
    # 画像とジャンルはまだ非搭載
    def item_params
        params.require(:item).permit(:name, :introduction, :price)
    end
    
    
end
