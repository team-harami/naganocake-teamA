class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_customers_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
   @customer = current_customer
   @customer.update(is_active: false)
   reset_session
   redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :telephone_number, :email)
  end
end