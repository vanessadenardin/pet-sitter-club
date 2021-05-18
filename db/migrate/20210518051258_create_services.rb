class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :pet_sitter_id, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
