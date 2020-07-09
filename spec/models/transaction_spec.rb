# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  approved    :boolean          default(FALSE)
#  lat         :decimal(10, 6)
#  lng         :decimal(10, 6)
#  start_from  :datetime
#  start_to    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
require "rails_helper"

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
