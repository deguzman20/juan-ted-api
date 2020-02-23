# == Schema Information
#
# Table name: estimated_tasks
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :estimated_task do
    type { "" }
  end
end
