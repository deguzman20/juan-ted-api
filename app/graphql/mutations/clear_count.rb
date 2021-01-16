module Mutations
  # mutation for creating new user
  class ClearCount < BaseMutation
    description "Clear count"

    argument :customer_id, Integer, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(**args)
      reset_notification_count = Customer.find(args[:customer_id])
      if reset_notification_count.present?
        reset_notification_count.notification_count = 0
        if reset_notification_count.save
          { response: 'Successfull updated', status_code: 200 }
        else
          { response: 'Failed to update', status_code: 422 }
        end
      else
        { response: "Customer id not present", status_code: 422 }
      end
    end
  end
end
