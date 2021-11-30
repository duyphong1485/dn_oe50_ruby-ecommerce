class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :fullname
      t.string :password
      t.string :email
      t.integer :role
      t.boolean :is_active
      t.string :remember

      t.timestamps
    end
  end
end
