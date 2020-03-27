class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :summary
      t.string :topic

      t.timestamps
    end
  end
end
