class AddVintageToWines < ActiveRecord::Migration[5.1]
  def change
    add_reference :wines, :vintage, foreign_key: true
  end
end
