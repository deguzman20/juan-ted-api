# == Schema Information
#
# Table name: customers
#
#  id                     :bigint           not null, primary key
#  auth_token             :string(255)
#  card_detail            :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  formatted_address      :string(255)
#  image                  :string(255)
#  last_name              :string(255)
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
#  mobile_number          :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  zip_code               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todos

  has_many :tasks
  has_many :taskers, through: :tasks

  has_many :reviews
  has_many :taskers, through: :reviews

  has_many :conversations
  has_many :taskers, through: :conversations

  has_many :transactions
  has_many :taskers, through: :transactions

  mount_base64_uploader :image, CustomerUploader
end
