class AddColToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banned, :boolean , default: false
    add_column :users, :posts_count, :integer, default: 0
  end
end
