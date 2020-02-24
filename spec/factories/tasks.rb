# == Schema Information
#
# Table name: tasks
#
#  id                     :bigint           not null, primary key
#  approved               :boolean          default("false")
#  end_location_address   :string
#  start_location_address :string
#  task_completed         :boolean          default("false")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  estimated_task_id      :integer
#  tasker_id              :integer
#
FactoryBot.define do
  factory :task do
    tasker_id { 1 }
    customer_id { 1 }
    estimated_task_id { 1 }
    start_location_address { "MyString" }
    end_location_address { "MyString" }
  end
end
