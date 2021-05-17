class AddCustomToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :abn, :string
    add_column :users, :about, :text
    add_column :users, :address, :string
    add_column :users, :post_code, :integer
    add_column :users, :role, :string
    add_column :users, :pet_type_id, :integer
  end
end