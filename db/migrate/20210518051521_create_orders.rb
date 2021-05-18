class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :client_id, null: false, foreign_key:  {to_table: :users}
      t.references :pet_sitter_id, null: false, foreign_key:  {to_table: :users}
      t.datetime :date
      t.boolean :status

      t.timestamps
    end
  end
end
