class CartItem < ApplicationRecord
    # belons_to :custommer
    belongs_to :item
    
    validates :customer_id, uniqueness: {scope: :item_id}
end
