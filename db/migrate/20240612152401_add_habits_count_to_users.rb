class AddHabitsCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :habits_count, :integer, default: 0
  end
end
