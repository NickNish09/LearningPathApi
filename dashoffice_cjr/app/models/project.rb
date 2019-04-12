class Project < ApplicationRecord
  belongs_to :customer
  has_many :project_requirements, dependent: :destroy
  has_many :project_developers, dependent: :destroy
  has_many :project_tags, dependent: :destroy
end
