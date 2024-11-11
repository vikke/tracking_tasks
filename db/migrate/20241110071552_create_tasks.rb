class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.integer :task_master_id
      t.integer :user_id
      t.datetime :start_time, precision: 6
      t.datetime :end_time, precision: 6

      t.timestamps
    end
  end
end
