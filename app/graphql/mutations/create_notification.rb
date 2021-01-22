module Mutations
  # mutation for creating todo
  class CreateNotification < BaseMutation
    description "Create notification"
    field :response, String, null: true
    argument :customer_id, Integer, required: true
    argument :tasker_id, Integer, required: true
    argument :text, String, required: true
    argument :date_created, String, required: true

    def resolve(** args)
      @notification = Notification.new(
                        customer_id: args[:customer_id],
                        tasker_id: args[:tasker_id],
                        text: args[:text],
                        date_created: args[:date_created]
                      )

      if @notification.save
          @customer = Customer.find(args[:customer_id])
          @customer.notification_count =  (@customer.notification_count.nil? ? 0 : @customer.notification_count) + 1
          { response: 'Successfuly updated' } if @customer.save
      end
    end
  end
end