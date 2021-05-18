class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.references :pet_types, null: false, foreign_key: {to_table: :pet_types}
      t.string :name
      t.integer :age
      t.string :observations

      t.timestamps
    end
  end
end
