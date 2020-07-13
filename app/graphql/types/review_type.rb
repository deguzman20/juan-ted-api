module Types
  # query object for review
  class ReviewType < BaseObject
    description "Review Type"
    field :id, ID, null: false
    field :rating, Float, null: false
    field :comment, String, null: false
    field :service_type, Types::ServiceType, null: true
    field :customer, Types::CustomerType, null: true
    field :tasker, Types::TaskerType, null: true
  end
end
