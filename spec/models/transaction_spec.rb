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
require "rails_helper"

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:customer).optional(true) }
  it { is_expected.to belong_to(:tasker).optional(true) }
  it { is_expected.to have_many(:transaction_services) }
  it { is_expected.to have_many(:services).through(:transaction_services) }
end
