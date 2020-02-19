class AddDisplacementToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :displacement, :integer
  end
end
