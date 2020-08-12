module Resolvers
  module QueryType
    class UnselectedServiceTypeResolver < GraphQL::Schema::Resolver
      description "List of unselected service type"

      argument :tasker_id, Integer, required: true

      type [Types::ServiceTypeType], null: false

      def resolve(** args)
        if args[:tasker_id] != ""
          
          @selected_featured_skill = FeaturedSkill.where(tasker_id: args[:tasker_id]).map(&:service_type_id)
          ::ServiceType.where("id NOT IN (?)", @selected_featured_skill)
        end
      end
    end
  end
end
