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
class Task < ApplicationRecord
  belongs_to :tasker
  belongs_to :customer
  belongs_to :estimated_task
end
