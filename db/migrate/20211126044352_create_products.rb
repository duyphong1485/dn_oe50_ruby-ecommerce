class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.string :image
      t.float :price
      t.datetime :create_date
      t.integer :quantity

      t.timestamps
    end
  end
end
