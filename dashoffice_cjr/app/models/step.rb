class Step < ApplicationRecord
    has_many :deal_steps, dependent: :destroy
    has_many :deals, through: :deal_steps   
end
