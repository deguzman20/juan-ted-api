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
class WhatIsIncluded < ApplicationRecord
  belongs_to :service, optional: true
end
