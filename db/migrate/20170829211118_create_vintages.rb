class CreateVintages < ActiveRecord::Migration[5.1]
  def change
    create_table :vintages do |t|
      t.references :wine, foreign_key: true
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
