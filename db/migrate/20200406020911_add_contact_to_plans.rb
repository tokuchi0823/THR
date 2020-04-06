class AddContactToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :contact, :string
  end
end
