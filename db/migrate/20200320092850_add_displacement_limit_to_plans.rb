class AddDisplacementLimitToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :displacement_limit, :integer
  end
end
