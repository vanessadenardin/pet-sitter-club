class CreateOrderServices < ActiveRecord::Migration[6.1]
  def change
    create_table :order_services do |t|
      t.references :order, null: false
      t.references :pet_sitter_service, null: false
      t.boolean :completed

      t.timestamps
    end
  end
end
