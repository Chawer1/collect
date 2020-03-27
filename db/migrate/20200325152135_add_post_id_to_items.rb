class AddPostIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :post_id, :integer
    add_index :items, :post_id
  end
end
