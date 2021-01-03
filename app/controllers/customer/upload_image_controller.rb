class Customer::UploadImageController < ApplicationController
  def customer_upload_image
    @message = nil
    @upload_customer = Customer.find(1)
    @upload_customer.image = params[:data]
    if @upload_customer.save!
      @message = 'Saved successfuly'
    else
      @message = 'Failed to saved'
    end
    render json: @message.to_json
  end
end
