class AddVideosToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :videos, :string
    add_column :courses, :video_name, :string
  end
end
