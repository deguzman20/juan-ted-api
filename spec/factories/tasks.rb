# == Schema Information
#
# Table name: tasks
#
#  id                     :bigint           not null, primary key
#  approved               :boolean          default(FALSE)
#  date_of_shedule        :datetime
#  end_location_address   :string(255)
#  latitude               :float(24)
#  longitude              :float(24)
#  number_of_hours        :integer
#  start_location_address :string(255)
#  status                 :boolean          default(FALSE)
#  street_address         :string(255)
#  task_completed         :boolean          default(FALSE)
#  unit_or_apt_no         :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  tasker_id              :integer
#
FactoryBot.define do
  factory :task do
    tasker_id { 1 }
    customer_id { 1 }
    start_location_address { "MyString" }
    end_location_address { "MyString" }
  end
end
