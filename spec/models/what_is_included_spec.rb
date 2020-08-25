# == Schema Information
#
# Table name: what_is_includeds
#
#  id         :bigint           not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require 'rails_helper'

RSpec.describe WhatIsIncluded, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
