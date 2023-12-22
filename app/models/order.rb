class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
# こう書くことでpayment_method(支払方法)に定義付け
#0→→→クレジットカード、1→→→銀行振込

  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  belongs_to :customer
  has_many :order_details, dependent: :destroy
end
