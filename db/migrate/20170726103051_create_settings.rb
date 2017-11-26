class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :url
      t.string :logo
      t.text :description
      t.text :address
      t.string :email
      t.float :long
      t.float :lat
      t.string :facebook
      t.string :title

      t.timestamps
    end
  end
end
