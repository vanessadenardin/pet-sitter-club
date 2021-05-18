class AddCustomToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :abn, :string
    add_column :users, :about, :text
    add_column :users, :address, :string
    add_column :users, :post_code, :integer
    add_column :users, :role, :string
  end
end
