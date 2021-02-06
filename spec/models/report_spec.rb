# == Schema Information
#
# Table name: reports
#
#  id           :bigint           not null, primary key
#  image        :string(255)
#  reason       :string(255)
#  valid_report :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  customer_id  :integer
#  tasker_id    :integer
#
require 'rails_helper'

RSpec.describe Report, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
