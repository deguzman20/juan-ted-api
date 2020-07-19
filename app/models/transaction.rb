# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  approved    :boolean          default(FALSE)
#  done        :boolean          default(FALSE)
#  favorate    :boolean
#  from        :datetime
#  lat         :decimal(10, 6)
#  lng         :decimal(10, 6)
#  to          :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
class Transaction < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :tasker, optional: true

  has_many :transaction_services
  has_many :services, through: :transaction_services
end
