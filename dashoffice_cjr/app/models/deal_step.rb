class DealStep < ApplicationRecord
  belongs_to :step
  belongs_to :deal
end
