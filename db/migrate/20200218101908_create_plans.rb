class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :purpose
      t.datetime :date
      t.string :meeting_place
      t.string :destination
      t.integer :secretary_id

      t.timestamps
    end
  end
end
