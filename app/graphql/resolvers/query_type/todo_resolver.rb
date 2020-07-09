module Resolvers
  module QueryType
    class TodoResolver < GraphQL::Schema::Resolver
      description "List of specific todo"

      argument :customer_id, Integer, required: true

      type [Types::TodoType], null: false

      def resolve(** args)
        ::Todo.where(customer_id: args[:customer_id]) unless args[:customer_id].nil?
      end
    end
  end
end
