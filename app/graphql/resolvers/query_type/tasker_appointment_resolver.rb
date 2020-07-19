module Resolvers
  module QueryType
    class TaskerAppointmentResolver < GraphQL::Schema::Resolver
      description "List of all tasker appointment"

      argument :tasker_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        ::Transaction.where(tasker_id: args[:tasker_id])
                     .where(approved: true) if args[:tasker_id].present?
      end
    end
  end
end
