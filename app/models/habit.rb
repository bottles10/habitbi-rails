class Habit < ApplicationRecord
    validates :name, presence: true
    validates :count, presence: true
end
