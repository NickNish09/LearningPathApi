class Deal < ApplicationRecord
  belongs_to :customer
  belongs_to :primary_seller, class_name: 'User'
  belongs_to :secondary_seller, class_name: 'User'
  has_many :deal_steps, dependent: :destroy
  has_many :steps, through: :deal_steps
  has_many :deal_tags, dependent: :destroy
  has_many :tags, through: :deal_tags 
end
