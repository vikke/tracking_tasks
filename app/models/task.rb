class Task < ApplicationRecord
  belongs_to :task_master
  belongs_to :user

  def spent_time
    if end_time.present?
      return ((end_time - start_time) / 60).round
    end
    nil
  end
end
