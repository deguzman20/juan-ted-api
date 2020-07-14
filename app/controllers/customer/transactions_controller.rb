class Customer::TransactionsController < ApplicationController
  def create_transaction
    @lat = params[:lat].to_d
    @lng = params[:lng].to_d
    @transaction = Transaction.new(
      tasker_id: params[:tasker_id].to_i, customer_id: params[:customer_id].to_i,
      lat: @lat, lng: @lng
    )

    render json: @transaction.id.to_json if @transaction.save
  end

  def create_bulk_of_transaction_service
    @message = nil

    @transaction_service = TransactionService.create(JSON.parse(params[:services]))
    @message = if @transaction_service
      "Transaction service was created successfuly"
    else
      "Failed to create"
    end

    render json: @message.to_json
  end
end
