class AddCapacityToOccurences < ActiveRecord::Migration[6.0]
  def change
    add_column :occurences, :capacity, :integer
  end
end
