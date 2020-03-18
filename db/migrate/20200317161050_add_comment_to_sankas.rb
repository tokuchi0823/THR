class AddCommentToSankas < ActiveRecord::Migration[5.1]
  def change
    add_column :sankas, :comment, :string
  end
end
