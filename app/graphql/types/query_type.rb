module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :customer, resolver: Resolvers::QueryType::CustomerResolver
    field :tasker, resolver: Resolvers::QueryType::TaskerResolver
    field :service, resolver: Resolvers::QueryType::ServiceResolver
    field :tasker_by_geolocation, resolver: Resolvers::QueryType::TaskerByGeolocationResolver
    field :todo, resolver: Resolvers::QueryType::TodoResolver
    field :all_customers, resolver: Resolvers::QueryType::CustomersResolver
    field :all_service_type, resolver: Resolvers::QueryType::ServiceTypeResolver
    field :all_taskers, resolver: Resolvers::QueryType::TaskersResolver
    field :all_reviews, resolver: Resolvers::QueryType::ReviewsResolver
    field :conversation_messages, resolver: Resolvers::QueryType::ConversationMessagesResolver
    field :conversation_list, resolver: Resolvers::QueryType::ConversationListResolver
  end
end
