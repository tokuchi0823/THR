class ChangeDatatypeSecretaryIdOfPlans < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :secretary_id, :integer
  end
end
