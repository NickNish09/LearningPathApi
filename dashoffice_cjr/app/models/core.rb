class Core < ApplicationRecord
    has_many :users, dependent: :destroy
end
