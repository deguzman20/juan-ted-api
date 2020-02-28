module Types
  # query object for user
  class TaskType < BaseObject
    description "Task Type"
    graphql_name "TASK_TYPE"
    field :id, ID, null: false
    field :tasker, Types::TaskerType, null: false
    field :customer, Types::CustomerType, null: false
    field :start_location_address, String, null: false
    field :end_location_address, String, null: false
    field :approved, Boolean, null: false
    field :task_completed, Boolean, null: false
  end
end
