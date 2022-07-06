class AddTaskRefToTaskLabel < ActiveRecord::Migration[7.0]
  def change
    add_reference :task_labels, :task, null: false, foreign_key: true
  end
end
