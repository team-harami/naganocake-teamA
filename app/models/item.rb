class Item < ApplicationRecord
    has_one_attached :item_image
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    
    
    def cart_item_by?(custommer)
        cart_items.exists?(custommer_id: custtome.id)
    end
    
    def get_image(width, height)
        item_image.variant(resize_to_limit: [width, height]).processed
    end
end
