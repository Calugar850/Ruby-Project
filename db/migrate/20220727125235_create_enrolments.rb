class CreateEnrolments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrolments do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
