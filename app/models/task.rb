class Task < ApplicationRecord
  # Associations
  has_many :task_labels
  has_many :labels, through: :task_labels
  has_many :work_sessions

  # Validations
  validates :title, presence: true
  validates :minutes, presence: true, numericality: { greater_than: 0 }

  # Defaults
  attribute :completed, :boolean, default: false
  attribute :minutes, :integer, default: 25

  # Methods
  alias_attribute :completed?, :completed

  def duration_in_hours
    return "#{minutes / 60}h" if (minutes % 60).zero?

    "#{minutes / 60}h #{pluralize('min', minutes % 60)}"
  end

  def time_spent
    work_sessions.inject(0) { |total, session| total + session.minutes }
  end

  private

  def pluralize(unit, quantity)
    quantity > 1 ? "#{quantity}#{unit}s" : "#{quantity}#{unit}"
  end
end
