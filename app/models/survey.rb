class Survey < ApplicationRecord
    belongs_to :ticket

    validates :rating, presence: true
    validates :comment, presence: true
end
