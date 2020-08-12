class Customer::CustomerImageController < ApplicationController
  def update_customer_image
    @response = nil
    @customer = Customer.first
    @customer.image = params[:image]
    @response = if @customer.save!
      { response: "Updated Successfuly", status_code: 200 }
    else
      { response: @customer.errors.full_messages.joins(","), status_code: 422 }
    end
    render json: @response.to_json
  end
end
