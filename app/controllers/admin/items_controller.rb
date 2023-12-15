class Admin::ItemsController < ApplicationController
    
    
    
    def index
        @items=Item.all
    end
    
    def new
        @item = Item.new
        
    end
    
    def create
        @item = Item.new(item_params)
        # ジャンルモデルを作成していないため、とりあえずgenre_idに１を入れとく
        @item.genre_id = 1 
        @item.save
        # 後でパス先を商品詳細に変更する
        redirect_to new_admin_item_path
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    private
    
    # ストロングパラメーター
    # 画像とジャンルはまだ非搭載
    def item_params
        params.require(:item).permit(:item_image, :name, :introduction, :price, :genre_id, :is_active)
    end
    
    
end
