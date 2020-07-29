module Mutations
  # mutation for creating todo
  class UpdateTaskerInfo < BaseMutation
    description "Update tasker info"
    argument :tasker_id, Integer, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :email, String, required: false
    argument :mobile_number, String, required: false

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      tasker = Tasker.find(args[:tasker_id])
      tasker.first_name = args[:first_name] if args[:first_name] != "" || !args[:first_name].nil?
      tasker.last_name = args[:last_name] if args[:last_name] != "" || !args[:last_name].nil?
      tasker.email = args[:email] if args[:email] != "" || !args[:email].nil?
      tasker.mobile_number = args[:mobile_number] if args[:mobile_number] != "" || !args[:mobile_number].nil?

      if tasker.save!
        { response: "Tasker info was updated!", status_code: 200 }
      else
        { response: tasker.errors.full_message.join(""), status_code: 422 }
      end
    end
  end
end
