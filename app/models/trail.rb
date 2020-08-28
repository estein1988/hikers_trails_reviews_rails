class Trail < ApplicationRecord
    has_many :reviews
    has_many :hikers, through: :reviews
end
