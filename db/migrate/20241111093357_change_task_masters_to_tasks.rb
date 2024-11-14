class ChangeTaskMastersToTasks < ActiveRecord::Migration[8.0]
  def change
    rename_table :task_masters, :tasks
  end
end
