module Mutations
  # mutation for creating new user
  class CreateTasker < BaseMutation
    description "Create Tasker"

    # base input object for email and password
    class TaskerAuthProviderSignupData < Types::BaseInputObject
      argument :email, Types::AuthProviderEmailInput, required: false
    end

    # Personal Information
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :image, String, required: false
    argument :mobile_number, String, required: true
    argument :zip_code, String, required: true
    argument :hourly_rate, Float, required: false
    argument :introduction, String, required: false

    argument :auth_provider, TaskerAuthProviderSignupData, required: false

    field :response, String, null: true
    field :status_code, Integer, null: false
    # type Types::UserType
    def resolve(auth_provider: nil, ** args)
      tasker = Tasker.new(
        email: auth_provider&.[](:email)&.[](:email),
        password: auth_provider&.[](:email)&.[](:password),
        first_name: args[:first_name],
        last_name: args[:last_name],
        image: args[:image],
        mobile_number: args[:mobile_number],
        zip_code: args[:zip_code],
        hourly_rate: args[:hourly_rate],
        introduction: args[:introduction]
      )

      if tasker.save
        { response: "Introduction Created", status_code: 200 }
      else
        { response: tasker.errors.full_message.join(""), status_code: 422 }
      end
    end
  end
end
