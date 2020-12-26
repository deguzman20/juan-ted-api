# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ServiceType < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :transactions

  has_many :featured_skills
  has_many :taskers, through: :featured_skills
  has_many :reviews, dependent: :destroy

  mount_base64_uploader :image, OfferUploader
end
