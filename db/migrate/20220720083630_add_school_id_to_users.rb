class AddSchoolIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :id_school, :integer
  end
end
