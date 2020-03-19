# == Schema Information
#
# Table name: tasks
#
#  id                     :bigint           not null, primary key
#  approved               :boolean          default("false")
#  date_of_shedule        :datetime
#  end_location_address   :string
#  latitude               :float
#  longitude              :float
#  number_of_hours        :integer
#  start_location_address :string
#  status                 :boolean          default("false")
#  street_address         :string
#  task_completed         :boolean          default("false")
#  unit_or_apt_no         :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  tasker_id              :integer
#
class Task < ApplicationRecord
  belongs_to :tasker
  belongs_to :customer
end
