class AddSpecialityToWines < ActiveRecord::Migration[5.1]
  def change
    add_column :wines, :speciality, :string
  end
end
