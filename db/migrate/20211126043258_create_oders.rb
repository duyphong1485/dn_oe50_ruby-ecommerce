class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      t.integer :account_id
      t.datetime :create_date
      t.float :total_money
      t.integer :address_id
      t.boolean :status

      t.timestamps
    end
  end
end
