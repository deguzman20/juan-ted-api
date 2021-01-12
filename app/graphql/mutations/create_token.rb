module Mutations
  # mutation for creating todo
  class CreateToken < BaseMutation
    require 'json'
    require 'ostruct'

    description "Create Token"
    argument :number, String, required: true
    argument :exp_month, String, required: true
    argument :exp_year, String, required: true
    argument :cvc, String, required: true
    argument :billing_address_id, Integer, required: true

    # argument :address_line_one, String, required: false
    # argument :address_line_two, String, required: false
    # argument :city, String, required: false
    # argument :state, String, required: false
    # argument :postal_code, String, required: false
    # argument :country, String, required: false

    # argument :name, String, required: false
    # argument :email, String, required: false
    # argument :mobile_no, String, required: false

    field :response, String, null: true
    field :status_code, Integer, null: false

    
    def resolve(** args)
      token = CreateTokenService.call(args[:number], args[:exp_month], args[:exp_year], 
                                      args[:cvc], args[:billing_address_id])

      obj = JSON.parse(token, object_class: OpenStruct)
      { response: obj.data.id, status_code: 200 }
    end
  end
end
