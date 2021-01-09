class Customer::UploadController < ApplicationController
  def index
  end

  def new
    @upload =  Customer.new
  end

  def create
    @upload = Customer.new(upload_params)
    if @upload.save
      redirect_to upload_path(@upload)
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:upload][:id])
    @customer.image = params[:upload][:image]
    render json: 'success'.to_json if @customer.save
  end
end
