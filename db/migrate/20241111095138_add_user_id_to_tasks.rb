class AddUserIdToTasks < ActiveRecord::Migration[8.0]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true, default: 1
    add_index :tasks, :task_name, unique: true
  end
end
