class ChangePasswordService < ApplicationService
  attr_accessor :id, :old_password, :new_password, :confirm_password, :is_customer

  def initialize(id, new_password, confirm_password, is_customer)
    @id = id
    @new_password = new_password
    @confirm_password = confirm_password
    @is_customer = is_customer
  end

  def call
    update_password
  end

  private

    def update_password
      if @is_customer
        customer = Customer.find(@id.to_i)
        if new_password == confirm_password
          customer.password = new_password
          "Password Successfuly updated!" if customer.save
        end
      else
        tasker = Tasker.find(@id.to_i)
        if new_password == confirm_password
          tasker.password = new_password
          "Password Successfuly updated!" if tasker.save
        end
      end
    end
end
