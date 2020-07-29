module Resolvers
  module QueryType
    class TaskerServiceTypeResolver < GraphQL::Schema::Resolver
      description "List of tasker service type"

      argument :tasker_id, Integer, required: true

      type [Types::FeaturedSkillType], null: false

      def resolve(** args)
        ::Tasker.find(args[:tasker_id]).featured_skills unless args.nil?
      end
    end
  end
end
