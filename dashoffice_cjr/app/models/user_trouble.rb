class UserTrouble < ApplicationRecord
  belongs_to :user
  belongs_to :trouble
end
