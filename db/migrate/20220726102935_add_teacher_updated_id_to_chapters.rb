class AddTeacherUpdatedIdToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :teacher_updated_id, :integer
  end
end
