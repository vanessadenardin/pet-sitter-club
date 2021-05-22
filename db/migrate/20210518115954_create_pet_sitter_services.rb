class CreatePetSitterServices < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_sitter_services do |t|
      t.references :pet_sitter, null: false, foreign_key:  {to_table: :users}
      t.references :service, null: false
      t.boolean :active

      t.timestamps
    end
  end
end
