# == Schema Information
#
# Table name: services
#
#  id              :bigint           not null, primary key
#  description     :text(65535)
#  image           :string(255)
#  name            :string(255)
#  price           :float(24)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_type_id :integer
#
class Service < ApplicationRecord
  mount_base64_uploader :image, OfferUploader
  belongs_to :service_type, optional: true

  has_many :keywords, dependent: :destroy

  has_many :transaction_services
  has_many :transactions, through: :transaction_services
end
