module Mutations
  # mutation for creating todo
  class CreateFeaturedSkill < BaseMutation
    description "Create featured skill"
    field :response, String, null: true
    field :status_code, String, null: false
    argument :tasker_id, Integer, required: true
    argument :service_type_id, Integer, required: true

    def resolve(** args)
      featured_skill = FeaturedSkill.new(service_type_id: args[:service_type_id], 
                          tasker_id: args[:tasker_id])
      if featured_skill.save
        { response: "Featured skill Created", status_code: 200 }
      else
        { response: featured_skill.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
