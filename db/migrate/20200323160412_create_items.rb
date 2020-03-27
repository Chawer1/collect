class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :post
      t.string :name
      t.string :tag

      t.timestamps
    end
  end
end
