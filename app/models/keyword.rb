# == Schema Information
#
# Table name: keywords
#
#  id         :bigint           not null, primary key
#  keyword    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
class Keyword < ApplicationRecord
  belongs_to :service
end
