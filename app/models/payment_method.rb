# == Schema Information
#
# Table name: payment_methods
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PaymentMethod < ApplicationRecord
  has_many :transactions
end
