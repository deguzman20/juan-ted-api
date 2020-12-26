# == Schema Information
#
# Table name: what_is_includeds
#
#  id         :bigint           not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
class WhatIsIncluded < ApplicationRecord
  belongs_to :service, optional: true
end
