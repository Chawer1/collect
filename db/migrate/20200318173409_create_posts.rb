class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :summary
      t.string :topic
      t.integer :user_id
      t.index :user_id
      t.timestamps
    end
  end
end
