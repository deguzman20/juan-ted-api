# == Schema Information
#
# Table name: transaction_services
#
#  id             :bigint           not null, primary key
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  service_id     :integer
#  transaction_id :integer
#
FactoryBot.define do
  factory :transaction_service do
    transaction_id { 1 }
    service_id { 1 }
    quantity { 1 }
  end
end
