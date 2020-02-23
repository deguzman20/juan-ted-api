# == Schema Information
#
# Table name: tasks
#
#  id                     :bigint           not null, primary key
#  approved               :boolean          default("0")
#  end_location_address   :string(255)
#  start_location_address :string(255)
#  task_completed         :boolean          default("0")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  estimated_task_id      :integer
#  tasker_id              :integer
#
require "rails_helper"

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:tasker) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:estimated_task) }
end
