class AddColumnsToOccurences < ActiveRecord::Migration[6.0]
  def change
    add_column :occurences, :location, :string
    add_column :occurences, :latitude, :float
    add_column :occurences, :longitude, :float
  end
end
