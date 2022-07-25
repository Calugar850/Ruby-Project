class AddCourseIdToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :id_course, :integer
  end
end
