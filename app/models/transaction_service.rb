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
class TransactionService < ApplicationRecord
  belongs_to :trans, class_name: :Transaction, foreign_key: "transaction_id"
  belongs_to :service, optional: true
end
