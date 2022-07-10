class LabelSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :time_spent

  has_many :tasks
end
