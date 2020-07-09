# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ServiceType < ApplicationRecord
  has_many :services

  has_many :featured_skills
  has_many :taskers, through: :featured_skills

  mount_uploader :image, OfferUploader
end
