class Habit < ApplicationRecord
    validates :name, presence: true
    validates :count, presence: true

    scope :ordered, -> { order(updated_at: :desc) }
end
