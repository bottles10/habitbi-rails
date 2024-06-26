class Habit < ApplicationRecord
    belongs_to :user, counter_cache: :habits_count, touch: true

    
    validates :name, presence: true
    validates :count, presence: true

    scope :ordered, -> { order(updated_at: :desc) }

     before_update :check_count

    def check_count
        self.count = 0 if count < 0
    end
end
