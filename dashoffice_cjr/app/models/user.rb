class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :primary_deals, class_name: 'Deal', foreign_key:'primary_seller_id', dependent: :destroy
  has_many :secondary_deals, class_name: 'Deal', foreign_key:'secondary_seller_id', dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :user_troubles, dependent: :destroy
  has_many :troubles, through: :user_troubles
  has_many :project_developers, dependent: :destroy
  has_many :projects, through: :project_developers

  after_create :update_access_token!

  def update_access_token!
    self.access_token = "#{Devise.friendly_token}"
    save
  end
end
