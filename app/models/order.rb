class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
# こう書くことでpayment_method(支払方法)に定義付け
#0→→→クレジットカード、1→→→銀行振込

  enum status: { waite_payment: 0, confirm_paymente: 1, under_making: 2, preparing_ship: 3, complete_ship: 4 }
  

  belongs_to :customer
  has_many :order_details, dependent: :destroy
end
