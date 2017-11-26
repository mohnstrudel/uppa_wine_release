class AddBackgroundColorToVintages < ActiveRecord::Migration[5.1]
  def change
    add_column :vintages, :background_color, :string
  end
end
