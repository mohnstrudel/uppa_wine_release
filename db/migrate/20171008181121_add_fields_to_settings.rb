class AddFieldsToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :vk, :string
    add_column :settings, :instagram, :string
    add_column :settings, :sales_phone, :string
    add_column :settings, :sales_name, :string
    add_column :settings, :sales_email, :string
    add_column :settings, :visit_phone, :string
    add_column :settings, :visit_name, :string
    add_column :settings, :visit_email, :string
    add_column :settings, :post_address, :text
  end
end
