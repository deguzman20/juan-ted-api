class Customer::UploadImageController < ApplicationController
  def customer_upload_image
    render json: params.to_json
  end
end
