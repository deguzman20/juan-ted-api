class GcashGrabPaymentService < ApplicationService

  require 'uri'
  require 'net/http'
  require 'openssl'

  attr_accessor :type_of_payment
  attr_accessor :amount
  attr_accessor :currency
  attr_accessor :redirect_to_success
  attr_accessor :redirect_to_failed
  attr_accessor :name
  attr_accessor :mobile_no
  attr_accessor :email

  attr_accessor :address_line_one
  attr_accessor :address_line_two
  attr_accessor :state
  attr_accessor :city
  attr_accessor :postal_code
  attr_accessor :country
  attr_accessor :address

  def initialize(type_of_payment, amount, currency, redirect_to_success, redirect_to_failed, name, mobile_no, email, address_line_one, address_line_two, state, city, postal_code, country, address)
    @type_of_payment  = type_of_payment
    @amount = amount
    @currency = currency
    @redirect_to_success = redirect_to_success
    @redirect_to_failed = redirect_to_failed
    @name = name
    @mobile_no = mobile_no
    @email = email
    @address_line_one = address_line_one
    @address_line_two = address_line_two
    @state = state
    @city = city
    @postal_code = postal_code
    @country = country
    @address = address
  end

  def call
    pay_via_gcash_or_grab_pay
  end

  private

    def pay_via_gcash_or_grab_pay
      url = URI("https://api.paymongo.com/v1/sources")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = 'application/json'
      request["Authorization"] = 'Basic cGtfdGVzdF92NHd4RGpVdVJYeEVtZ3F5NVhIOTVocDU6'
      request.body = "
      {
        \"data\":
          {\"attributes\":{
            \"amount\":#{amount},
            \"redirect\":{
              \"success\":\"#{redirect_to_success}\",
              \"failed\":\"#{redirect_to_failed}\"},
            \"billing\":{
              \"address\":{
              \"line1\":\"#{address_line_one}\",
              \"line2\":\"#{address_line_two}\",
              \"country\":\"#{country}\",
              \"city\":\"#{city}\",
              \"postal_code\":\"#{postal_code}\",
              \"state\":\"#{state}\"
            },
            \"name\":\"#{name}\",
            \"phone\":\"#{mobile_no}\",
            \"email\":\"#{email}\"
          },
          \"type\":\"#{type_of_payment}\",
          \"currency\":\"#{currency}\"}
          }
        }"
      
      response = http.request(request)
      return response.read_body
    end
  end