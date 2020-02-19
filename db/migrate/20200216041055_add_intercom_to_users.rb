class AddIntercomToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :intercom, :boolean, default: false
  end
end
