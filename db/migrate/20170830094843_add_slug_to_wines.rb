class AddSlugToWines < ActiveRecord::Migration[5.1]
  def change
    add_column :wines, :slug, :string
    add_index :wines, :slug, unique: true
  end
end
