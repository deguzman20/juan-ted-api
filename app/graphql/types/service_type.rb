module Types
  # query object for service
  class ServiceType < BaseObject
    description "Service Type"
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :image, String, null: false
    field :price, Float, null: false
  end
end
