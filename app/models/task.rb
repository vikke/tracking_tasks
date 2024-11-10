class Task < ApplicationRecord
  belongs_to :task_master
  belongs_to :user
end
