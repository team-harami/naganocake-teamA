class Item < ApplicationRecord
    has_one_attached :item_image
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy


    # def cart_item_by?(customer)
    #     cart_items.exists?(customer_id: customer.id)
    # end

    def get_item_image(width, height)
        item_image.variant(resize_to_limit: [width, height]).processed
    end
    
    def with_tax_price
    (price * 1.1).floor
    end
end
