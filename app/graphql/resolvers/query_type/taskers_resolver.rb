module Resolvers
  module QueryType
    class TaskersResolver < GraphQL::Schema::Resolver
      description "List of all tasker"

      type [Types::TaskerType], null: false

      def resolve
        ::Tasker.all
      end
    end
  end
end
