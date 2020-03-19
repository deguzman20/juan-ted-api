class Customer::ChangePasswordController < ApplicationController
  def change_password
    Customer.find(params[:id])
  end
end
