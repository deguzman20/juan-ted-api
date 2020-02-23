# == Schema Information
#
# Table name: featured_skills
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#  tasker_id  :integer
#
FactoryBot.define do
  factory :featured_skill do
    service_id { 1 }
    tasker_id { 1 }
  end
end
