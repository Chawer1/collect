class AddAncestryToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :ancestry, :string
  end
end
