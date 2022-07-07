class Label < ApplicationRecord
  # Associations
  has_many :task_labels
  has_many :tasks, through: :task_labels

  # Validations
  validates :title, presence: true
end
