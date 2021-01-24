# == Schema Information
#
# Table name: reports
#
#  id          :bigint           not null, primary key
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
class Report < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :tasker, optional: true

  mount_base64_uploader :image, ReportUploader
end
