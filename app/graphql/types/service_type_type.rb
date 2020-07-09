module Types
  # query object for service type
  class ServiceTypeType < BaseObject
    description "Service Type"
    field :id, ID, null: false
    field :name, String, null: false
    field :image, String, null: false
  end
end
