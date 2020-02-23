module Resolvers
  module QueryType
    class TaskerResolver < GraphQL::Schema::Resolver
      argument :id, Integer, required: true
      description "Single Tasker"

      type [Types::TaskerType], null: false

      def resolve(** args)
        ::Tasker.where(id: args[:id]) unless args[:id].nil?
      end
    end
  end
end
