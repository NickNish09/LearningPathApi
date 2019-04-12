class Trouble < ApplicationRecord
    has_many :user_troubles, dependent: :destroy
    has_many :users, through: :user_troubles
end
