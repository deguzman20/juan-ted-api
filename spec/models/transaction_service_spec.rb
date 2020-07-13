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
require "rails_helper"

RSpec.describe TransactionService, type: :model do
  it { is_expected.to belong_to(:trans).class_name(:Transaction) }
  it { is_expected.to belong_to(:service).optional(:true) }
end
