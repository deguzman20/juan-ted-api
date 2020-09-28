class CheckoutController < ApplicationController
  def redirect_to_paypal
    transaction_service = TransactionService.new
    transaction = Transaction.find_by_customer_id(1)
    transaction_services = TransactionService.where(transaction_id: transaction.id)
    base_url = request.base_url
    redirect_to transaction_service.paypal_url(transaction_services, base_url)
  end

  def redirect
  end
end
