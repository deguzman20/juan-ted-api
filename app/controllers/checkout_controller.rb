class CheckoutController < ApplicationController
  $customer_id = nil

  def redirect_to_paypal
    $customer_id = params[:customer_id].to_i
    transaction_service = TransactionService.new
    transaction = Transaction.find_by_customer_id(params[:customer_id].to_i)
    transaction_services = TransactionService.where(transaction_id: transaction.id)
    base_url = request.base_url
    redirect_to transaction_service.paypal_url(transaction_services, base_url)
  end

  def redirect
  end

  def execute
    payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    transactions = payment.links.find { |v| v.rel == 'approval_url' }
    if payment.execute(payer_id: params[:PayerID])
      subtotal = 0
      transaction = Transaction.where(customer_id: $customer_id.to_i).last
      transaction.paid = true
      if transaction.save
        render json: 'Success'.to_json
      end
    else
      payment.error # Error Hash
    end
  end
end
