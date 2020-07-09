# == Schema Information
#
# Table name: featured_skills
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_type_id :integer
#  tasker_id       :integer
#
class FeaturedSkill < ApplicationRecord
  belongs_to :tasker
  belongs_to :service_type
end
  