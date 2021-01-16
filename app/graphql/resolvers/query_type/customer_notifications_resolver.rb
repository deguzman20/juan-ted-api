module Resolvers
  module QueryType
    class CustomerNotificationsResolver < GraphQL::Schema::Resolver
      description "List of all notifications per customer"

      argument :customer_id, Integer, required: true

      type [Types::NotificationType], null: false

      def resolve(** args)
        if args.present?
          ::Notification.where(customer_id: args[:customer_id])
        end
      end
    end
  end
end
