class Task < ApplicationRecord
  has_many :task_labels
  has_many :labels, through: :task_labels

  attribute :completed, :boolean, default: false
  attribute :minutes, :integer, default: 0

  alias_attribute :completed?, :completed
end
