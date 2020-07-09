module Types
  # query object for todo
  class TodoType < BaseObject
    description "Todo"
    field :id, ID, null: false
    field :todo_description, String, null: true
    field :service, Types::ServiceType, null: true
  end
end
