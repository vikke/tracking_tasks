class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.integer :task_master_id
      t.integer :user_id
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
