class AddDeadlineDateToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :deadline_date, :datetime
  end
end
