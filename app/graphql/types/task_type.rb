module Types
  # query object for user
  class TaskType < BaseObject
    description "Task Type"
    field :id, ID, null: false
    field :tasker, Types::TaskerType, null: true
    field :customer, Types::CustomerType, null: false
    field :start_location_address, String, null: false
    field :end_location_address, String, null: false
    field :approved, Boolean, null: false
    field :task_completed, Boolean, null: false
  end
end
