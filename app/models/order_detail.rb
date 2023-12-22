class OrderDetail < ApplicationRecord

  enum making_status: { 製作不可: 0, 製作待ち: 1, 
  
  belongs_to :order
  belongs_to :item
end
