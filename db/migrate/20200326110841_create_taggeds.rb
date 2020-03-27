class CreateTaggeds < ActiveRecord::Migration[6.0]
  def change
    create_table :taggeds do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
