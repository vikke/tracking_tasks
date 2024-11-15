class TaskRecord < ApplicationRecord
  belongs_to :task
  belongs_to :user

  def spent_time
    if end_time.present?
      return (end_time - start_time)
    end
    nil
  end
end
