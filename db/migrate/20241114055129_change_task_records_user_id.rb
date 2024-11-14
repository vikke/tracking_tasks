class ChangeTaskRecordsUserId < ActiveRecord::Migration[8.0]
  def change
    rename_column :task_records, :task_master_id, :task_id

    
    add_foreign_key :task_records, :tasks, column: :task_id
    add_foreign_key :task_records, :users, column: :user_id
  end
end
