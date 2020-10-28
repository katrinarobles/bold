class RemoveTimeFromOccurences < ActiveRecord::Migration[6.0]
  def change
    remove_column :occurences, :time
  end
end
