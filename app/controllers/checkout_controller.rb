class CheckoutController < ApplicationController
  $customer_id = nil
  $tasker_id = nil

  def redirect_to_paypal
    $customer_id = params[:customer_id].to_i
    $tasker_id = params[:tasker_id].to_i
    transaction_service = TransactionService.new
    transaction = Transaction.where(customer_id: params[:customer_id].to_i).last
    transaction_services = TransactionService.where(transaction_id: transaction.id)
                                              .where("quantity != ? ", 0)
    base_url = request.base_url
    redirect_to transaction_service.paypal_url(transaction_services, base_url)
  end

  def redirect ;end

  def execute
    payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    transactions = payment.links.find { |v| v.rel == 'approval_url' }
    if payment.execute(payer_id: params[:PayerID])
      subtotal = 0
      transaction = Transaction.where(customer_id: $customer_id.to_i).last
      conversation = Conversation.new
      conversation.customer_id = $customer_id
      conversation.tasker_id = $tasker_id
      transaction.paid = true
      transaction.approved = true
      if transaction.save && conversation.save
        render json: "".to_json
      end
    else
      payment.error # Error Hash
    end
  end
end
