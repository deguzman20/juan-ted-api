class JuanTedApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  
  use GraphQL::Subscriptions::ActionCableSubscriptions, redis: Redis.new
  subscription(Types::SubscriptionType)

  # use GraphQL::Execution::Interpreter
  # use GraphQL::Analysis::AST
  # use GraphQL::Backtrace
  # use GraphQL::Execution::Errors
  # use GraphQL::Analysis::AST
end
