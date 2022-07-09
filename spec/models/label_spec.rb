require 'rails_helper'

RSpec.describe Label, type: :model do
  let!(:read_japanese) { Task.create!(title: 'Read Japanese', minutes: 62) }
  let!(:read_korean) { Task.create!(title: 'Read Korean', minutes: 62) }
  let!(:japanese_label) do
    WorkSession.create!(task: read_japanese, minutes: 90)
    label = Label.new(title: 'Japanese')
    label.tasks << read_japanese
    label.save!
    label
  end
  let!(:korean_label) do
    WorkSession.create!(task: read_korean, minutes: 30)
    WorkSession.create!(task: read_korean, minutes: 90)
    label = Label.new(title: 'Korean')
    label.tasks << read_korean
    label.save!
    label
  end

  # Associations tests
  it { should have_many(:task_labels) }
  it { should have_many(:tasks) }

  # Validation tests
  it { should validate_presence_of(:title) }

  # Methods
  it 'returns the total of minutes spent for one work sessions' do
    expect(japanese_label.time_spent).to eq(90)
  end

  it 'returns the total of minutes spent for many work sessions' do
    expect(korean_label.time_spent).to eq(120)
  end

  # it returns the total of minutes spent when there are multiple tasks
end
