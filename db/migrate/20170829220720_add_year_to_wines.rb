class AddYearToWines < ActiveRecord::Migration[5.1]
  def change
    add_column :wines, :year, :string
  end
end
