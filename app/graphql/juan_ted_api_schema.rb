class JuanTedApiSchema < GraphQL::Schema
  use GraphQL::Subscriptions::ActionCableSubscriptions
  mutation(Types::MutationType)
  query(Types::QueryType)
end
