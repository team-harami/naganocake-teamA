class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  
  enum making_method: { impossible_making: 0, waite_making: 1, under_making: 2,　complete_making: 3 }

end
