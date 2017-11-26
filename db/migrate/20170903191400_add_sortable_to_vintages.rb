class AddSortableToVintages < ActiveRecord::Migration[5.1]
  def change
    add_column :vintages, :sortable, :integer
  end
end
