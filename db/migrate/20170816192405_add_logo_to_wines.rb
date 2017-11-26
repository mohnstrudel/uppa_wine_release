class AddLogoToWines < ActiveRecord::Migration[5.1]
  def change
    add_column :wines, :logo, :string
  end
end
