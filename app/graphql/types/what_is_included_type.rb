module Types
  # query object for user
  class WhatIsIncludedType < BaseObject
    description "what is included use type"
    field :id, ID, null: false
    field :text, String, null: false
    field :service, Types::ServiceType, null: true
  end
end
