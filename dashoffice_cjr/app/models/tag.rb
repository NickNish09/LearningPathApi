class Tag < ApplicationRecord
    has_many :deal_tags, dependent: :destroy
    has_many :deals, through: :deal_tags
    has_many :project_tags, dependent: :destroy
    has_many :projects, through: :project_tags   
end
