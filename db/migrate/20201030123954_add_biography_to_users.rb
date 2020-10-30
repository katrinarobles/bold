class AddBiographyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :biography, :text
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
  end
end
