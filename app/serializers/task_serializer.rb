class TaskSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :minutes,
             :duration_in_hours, :time_spent, :average_session

  has_many :labels
end
