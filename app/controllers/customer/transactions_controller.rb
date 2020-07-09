class Customer::TransactionsController < ApplicationController
  def create_transaction
    @message = nil
    @services = nil
    @lat = params[:lat].to_d
    @lng = params[:lng].to_d
    @transaction = Transaction.new(
      tasker_id: params[:tasker_id].to_i, customer_id: params[:customer_id].to_i,
      lat: @lat, lng: @lng)

    if @transaction.save
      render json: @transaction.id.to_json
    end
  end

  def create_bulk_of_transaction_service
    [params[:services]].each do |service|
      @services = service.to_s.gsub('\"', '').gsub('"', '')
    end
    if @services != nil
      @serv = @services
      render json:  @services.to_json
    end
  end
end