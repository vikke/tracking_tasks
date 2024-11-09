class CreateTaskMasters < ActiveRecord::Migration[8.0]
  def change
    create_table :task_masters do |t|
      t.string :task_name

      t.timestamps
    end
  end
end
