class AddSlugToVintages < ActiveRecord::Migration[5.1]
  def change
    add_column :vintages, :slug, :string
    add_index :vintages, :slug, unique: true
  end
end
