class CreateTokenService < ApplicationService

  require 'uri'
  require 'net/http'
  require 'openssl'

  attr_accessor :number
  attr_accessor :exp_month
  attr_accessor :exp_year
  attr_accessor :cvc

  def initialize(number, exp_month, exp_year, cvc, billing_address_id)
    @number = number
    @exp_month = exp_month
    @exp_year = exp_year
    @cvc = cvc
    @billing_address_id = billing_address_id
  end

  def call
    create_token  
  end

  private

    def create_token
      @billing_address = BillingAddress.find(@billing_address_id)
      url = URI("https://api.paymongo.com/v1/tokens")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = 'application/json'
      request["Authorization"] = 'Basic cGtfdGVzdF92NHd4RGpVdVJYeEVtZ3F5NVhIOTVocDU6'
      request.body = 
        "{
          \"data\":{
            \"attributes\":
              {\"billing\":
                {\"address\":
                  {
                    \"line1\":\"#{@billing_address.address_line_one}\",
                    \"line2\":\"#{@billing_address.address_line_two}\",
                    \"city\":\"#{@billing_address.city}\",
                    \"state\":\"#{@billing_address.state}\",
                    \"postal_code\":\"#{@billing_address.postal_code}\",
                    \"country\":\"PH\"
                  },
              \"name\":\"#{@billing_address.first_name}\",
              \"email\":\"#{@billing_address.email}\",
              \"phone\":\"#{@billing_address.mobile_number}\"
              },
              \"number\":\"#{number}\",
              \"exp_month\":#{exp_month},
              \"exp_year\":#{exp_year},
              \"cvc\":\"#{cvc}\"
              }
            }
          }"

      response = http.request(request)
      return response.read_body
    end
  end