class AddOthers2ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :etc, :boolean, default: false
    add_column :users, :continuous_cruising_distance, :integer
    add_column :users, :navi, :boolean, default: false
  end
end
