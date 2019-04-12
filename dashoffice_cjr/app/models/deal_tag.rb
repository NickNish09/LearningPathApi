class DealTag < ApplicationRecord
  belongs_to :deal
  belongs_to :tag
end
