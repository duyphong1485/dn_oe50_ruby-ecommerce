class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :address do |t|
      t.integer :account_id
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
