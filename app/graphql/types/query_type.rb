module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :customer, resolver: Resolvers::QueryType::CustomerResolver
    field :tasker, resolver: Resolvers::QueryType::TaskerResolver
    field :service, resolver: Resolvers::QueryType::ServiceResolver
    field :tasker_by_geolocation, resolver: Resolvers::QueryType::TaskerByGeolocationResolver
    field :favorate_tasker_by_geolocation, resolver: Resolvers::QueryType::FavorateTaskerByGeolocationResolver
    field :todo, resolver: Resolvers::QueryType::TodoResolver
    field :transaction_service, resolver: Resolvers::QueryType::TransactionServiceResolver
    field :all_customers, resolver: Resolvers::QueryType::CustomersResolver
    field :all_service_type, resolver: Resolvers::QueryType::ServiceTypeResolver
    field :all_taskers, resolver: Resolvers::QueryType::TaskersResolver
    field :all_reviews, resolver: Resolvers::QueryType::ReviewsResolver
    field :unselected_service_type, resolver: Resolvers::QueryType::UnselectedServiceTypeResolver
    field :conversation_messages, resolver: Resolvers::QueryType::ConversationMessagesResolver
    field :conversation_list, resolver: Resolvers::QueryType::ConversationListResolver
    field :past_tasker_list, resolver: Resolvers::QueryType::PastTaskerResolver
    field :favorate_tasker_list, resolver: Resolvers::QueryType::FavorateTaskerResolver
    field :tasker_appointment_list, resolver: Resolvers::QueryType::TaskerAppointmentResolver
    field :pending_transaction_service_info, resolver: Resolvers::QueryType::PendingTransactionServiceInfoResolver
    field :pending_transaction_list, resolver: Resolvers::QueryType::PendingTransactionResolver
    field :tasker_service_type_list, resolver: Resolvers::QueryType::TaskerServiceTypeResolver
    field :customer_scheduled_transaction_list, resolver: Resolvers::QueryType::CustomerScheduledTransactionListResolver
    field :customer_completed_transaction_list, resolver: Resolvers::QueryType::CustomerCompletedTransactionListResolver 
  end
end
