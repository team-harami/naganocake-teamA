class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
  end
end

# 注文機能実装後、確認必要