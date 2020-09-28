# == Schema Information
#
# Table name: transaction_services
#
#  id             :bigint           not null, primary key
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  service_id     :integer
#  transaction_id :integer
#
class TransactionService < ApplicationRecord
  require 'paypal-sdk-rest'
  include PayPal::SDK::REST

  belongs_to :trans, class_name: :Transaction, foreign_key: "transaction_id"
  belongs_to :service, optional: true

  PayPal::SDK::REST.set_config(
    mode: 'sandbox', # "sandbox" or "live"
    client_id: 'AYjZT2tas5_xjKODvKSW1DEXVieC0wn4EWR4H_bn7vfP4PwdjTlY5kjL640PZgRhrWbk71Fy62tO87IJ',
    client_secret: 'EDuYKlUbkwgH8wGLetN0Gk6a0l4BUBuCFqh0JIvuXavIKBrewa5G5AAA7vbPpe_xd08GWfzSSvSuO9BX'
  )

  def paypal_url(transaction_service, url)
    @url = url
    itemlist = []
    @total = []
    @index = 0
    transaction_service.each do |ts|
      @id = ts.service_id
      @price    = ts.service.price
      @quantity = ts.quantity
      @index += 1
      Service.where(id: @id).each_with_index do |service, _index|
        itemlist << {
          name: service.name.to_s,
          price: @price.to_s,
          currency: 'PHP',
          quantity: @quantity.to_s
        }
      end
      # itemlist << {
      #   name: 'Shipping Fee',
      #   price: additional,
      #   currency: 'PHP',
      #   quantity: 1
      # }
    end

    itemlist.each do |items|
      pp items
      @total << items[:price].to_i * items[:quantity].to_i
    end
    pp itemlist
    @grand_total = @total.sum
    pp itemlist
    pp @grand_total
    pp @total.sum.to_s
    @payment = Payment.new(
      intent: 'sale',
      payer: {
        payment_method: 'paypal'
      },
      redirect_urls: {
        return_url: "#{@url}/execute",
        cancel_url: "#{@url}/cart"
      },
      transactions: [{
        item_list: {
          items: itemlist
        },
        amount: {
          total: @grand_total.to_s,
          currency: 'PHP'
        },
        description: 'This is the payment transaction description.'
      }]
    )
    if @payment.create
      @redirect_url = @payment.links.find { |v| v.rel == 'approval_url' }.href
    else
      logger.error @payment.error.inspect
    end
  end


end
