module Mutations
  # mutation for creating todo
  class UpdateTaskerGeolocation < BaseMutation
    description "Update tasker geolocation"
    argument :tasker_id, Integer, required: true
    argument :lng, String, required: true
    argument :lat, String, required: true
    argument :formatted_address, String, required: false
    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      tasker = Tasker.find(args[:tasker_id])
      tasker.lng = args[:lng].to_d
      tasker.lat = args[:lat].to_d
      tasker.formatted_address = args[:formatted_address]
      if tasker.save
        { response: "Update was successfully", status_code: 200 }
      else
        { response: tasker.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
