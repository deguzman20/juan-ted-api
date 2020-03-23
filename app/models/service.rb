# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Service < ApplicationRecord
  has_many :featured_skills
  has_many :taskers, through: :featured_skills
  has_many :reviews
  has_many :keywords

  mount_uploader :image, OfferUploader
end
