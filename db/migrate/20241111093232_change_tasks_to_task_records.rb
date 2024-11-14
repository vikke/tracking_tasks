class ChangeTasksToTaskRecords < ActiveRecord::Migration[8.0]
  def change
    rename_table :tasks, :task_records
  end
end
