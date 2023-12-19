class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
# こう書くことでpayment_method(支払方法)に定義付け
#0→→→クレジットカード、1→→→銀行振込

  enum status

  belongs_to :customer
end
