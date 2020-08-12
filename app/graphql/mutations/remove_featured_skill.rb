module Mutations
  # mutation for removing to favorate tasker
  class RemoveFeaturedSkill < BaseMutation
    description "Removed to favorate tasker"

    argument :tasker_id, Int, required: true
    argument :service_type_id, Int, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      if args.present?
        @featured_skill = FeaturedSkill.where(tasker_id: args[:tasker_id])
                                       .where(service_type_id: args[:service_type_id])
      end
      if @featured_skill.present?
        @fs = FeaturedSkill.find(@featured_skill.ids[0])
        if @fs.delete
          { response: "Successfuly removed to your selected featured skill", status_code: 200 }
        else
          { response: @fs.errors.full_messages.join(""), status_code: 422 }
        end
      else
        { response: "featured skill does'nt exist", status_code: 422 }
      end
    end
  end
end
