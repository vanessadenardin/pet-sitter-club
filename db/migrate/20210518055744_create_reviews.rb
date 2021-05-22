class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review
      t.datetime :date
      t.integer :rating
      t.references :pet_sitter, null: false, foreign_key:  {to_table: :users}
      t.references :client, null: false, foreign_key:  {to_table: :users}
      t.references :order, null: false
      t.timestamps
    end
  end
end
