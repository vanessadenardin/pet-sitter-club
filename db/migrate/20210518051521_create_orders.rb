class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :pet_sitter_id
      t.datetime :date
      t.boolean :status

      t.timestamps
    end
  end
end
