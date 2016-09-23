class CreateJoinTableProjectStudent < ActiveRecord::Migration[5.0]
  def change
    create_join_table :projects, :students do |t|
      # t.index [:project_id, :student_id]
      # t.index [:student_id, :project_id]
    end
  end
end
