class AddUserIdToClocks < ActiveRecord::Migration[5.1]
  def change
    add_column :clocks, :user_id, :integer, null: true
    add_foreign_key :clocks, :users, column: :user_id
  end
end
