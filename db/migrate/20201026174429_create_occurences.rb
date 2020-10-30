class CreateOccurences < ActiveRecord::Migration[6.0]
  def change
    create_table :occurences do |t|
      t.datetime :date
      t.string :time
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
