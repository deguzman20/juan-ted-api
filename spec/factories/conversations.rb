# == Schema Information
#
# Table name: conversations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
FactoryBot.define do
  factory :conversation do
    customer_id { 1 }
    tasker_id { 1 }
  end
end
