class AddHstoreForOpeningHoursToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :opening_hours, :hstore
  end
end
