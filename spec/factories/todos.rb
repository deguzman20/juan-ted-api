# == Schema Information
#
# Table name: todos
#
#  id               :bigint           not null, primary key
#  todo_description :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_id      :integer
#  service_id       :integer
#
FactoryBot.define do
  factory :todo do
    service_id { 1 }
    customer_id { 1 }
  end
end
