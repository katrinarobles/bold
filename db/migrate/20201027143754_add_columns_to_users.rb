class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :teacher, :boolean
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :telephone, :string
  end
end
