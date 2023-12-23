class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @order = Order.all
  end
end

# 注文機能実装後、確認必要