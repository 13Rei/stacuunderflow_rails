class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
    add_foreign_key :posts, :users, column: :user_id
  end
end
