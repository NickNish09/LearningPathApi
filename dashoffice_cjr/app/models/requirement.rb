class Requirement < ApplicationRecord
    has_many :project_requirements, dependent: :destroy
end
