class Address < ApplicationRecord

  belongs_to :customer

  def set_address
    '〒'+postal_code+' '+address+' '+name
  end
# 住所に関係あるset_addressというオリジナルメソッドを定義。
# '文字列'+カラム名+''←半角の空間も文字列扱いでこの記述

end
