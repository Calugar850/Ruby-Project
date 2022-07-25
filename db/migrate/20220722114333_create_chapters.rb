class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.integer :school_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
