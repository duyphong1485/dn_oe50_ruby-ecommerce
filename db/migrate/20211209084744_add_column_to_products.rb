class AddColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :residual, :integer
  end
end
