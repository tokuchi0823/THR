class AddCautionToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :caution, :string
  end
end
