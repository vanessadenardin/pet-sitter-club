class CreatePetTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_types do |t|
      t.string :pet_type_name

      t.timestamps
    end
  end
end
