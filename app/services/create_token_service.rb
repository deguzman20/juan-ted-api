class CreateTokenService < ApplicationService

  require 'uri'
  require 'net/http'
  require 'openssl'

  attr_accessor :number
  attr_accessor :exp_month
  attr_accessor :exp_year
  attr_accessor :cvc

  attr_accessor :address_line_one
  attr_accessor :address_line_two
  attr_accessor :city
  attr_accessor :state
  attr_accessor :postal_code
  attr_accessor :country

  attr_accessor :name
  attr_accessor :email
  attr_accessor :mobile_no

  def initialize(number, exp_month, exp_year, cvc, address_line_one, address_line_two, 
    city, state, postal_code, country, name, email, mobile_no)
    @number = number
    @exp_month = exp_month
    @exp_year = exp_year
    @cvc = cvc
    @address_line_one = address_line_one
    @address_line_two = address_line_two
    @city = city
    @state = state
    @postal_code = postal_code
    @country = country
    @name = name
    @email = email
    @mobile_no = mobile_no
  end

  def call
    create_token  
  end

  private

    def create_token
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
                    \"line1\":\"#{address_line_one}\",
                    \"line2\":\"#{address_line_two}\",
                    \"city\":\"#{city}\",
                    \"state\":\"#{state}\",
                    \"postal_code\":\"#{postal_code}\",
                    \"country\":\"#{country}\"
                  },
              \"name\":\"#{name}\",
              \"email\":\"#{email}\",
              \"phone\":\"#{mobile_no}\"
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