class RemoveCoordinatesToCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :latitude
    remove_column :courses, :longitude
  end
end
