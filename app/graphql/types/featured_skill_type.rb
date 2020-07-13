module Types
  # query object for featured skill
  class FeaturedSkillType < BaseObject
    description "Featured skill"
    field :id, ID, null: false
    field :service_type, Types::ServiceTypeType, null: true
  end
end
