class Label < ApplicationRecord
  # Associations
  has_many :task_labels, dependent: :destroy
  has_many :tasks, through: :task_labels

  # Validations
  validates :title, presence: true

  def time_spent
    tasks.inject(0) { |total, task| total + task.time_spent }
  end
end
