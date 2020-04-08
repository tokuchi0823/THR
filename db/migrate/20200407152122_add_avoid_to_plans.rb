class AddAvoidToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :avoidferries, :boolean, default: false
    add_column :plans, :avoidhighways, :boolean, default: false
    add_column :plans, :avoidtolls, :boolean, default: false
  end
end
