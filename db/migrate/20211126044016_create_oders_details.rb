class CreateOdersDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :oders_details do |t|
      t.integer :oder_id
      t.integer :product_id
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
