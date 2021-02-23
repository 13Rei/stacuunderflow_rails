class AddCorrectValueToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :isCorrect, :integer
  end
end
