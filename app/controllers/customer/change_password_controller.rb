class Customer::ChangePasswordController < ApplicationController
  def change_password
    customer = Customer.find(params[:id])
  end
end
