class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :title
      t.text :description
      t.datetime :harvest_year
      t.integer :bottle_amount
      t.string :spirit
      t.string :oxygen
      t.string :aroma
      t.string :looks
      t.string :taste
      t.text :recommendations
      t.string :aging_period

      t.timestamps
    end
  end
end
