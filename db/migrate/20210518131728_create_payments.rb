class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false
      t.string :payment_reference
      t.decimal :total_amount, precision: 5, scale: 2
      
      t.timestamps
    end
  end
end
