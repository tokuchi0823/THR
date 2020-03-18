class AddOthers2ToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :overview, :string
    add_column :plans, :finish_date, :datetime
    add_column :plans, :passing_point1, :string
    add_column :plans, :passing_point2, :string
    add_column :plans, :passing_point3, :string
    add_column :plans, :passing_point4, :string
    add_column :plans, :passing_point5, :string
  end
end
