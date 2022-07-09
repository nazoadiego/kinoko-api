require 'rails_helper'


RSpec.describe Task, type: :model do
  let!(:read_japanese) { Task.create!(title: 'Read Japanese', minutes: 62) }
  let!(:read_korean) { Task.create!(title: 'Read Japanese', minutes: 61) }
  let!(:read_chinese) { Task.create!(title: 'Read Japanese', minutes: 60) }
  let!(:negative_minutes_task) { Task.create(title: 'Not reading Japanese!', minutes: -1)}
  let!(:sixty_mins_work) { WorkSession.create(task: read_japanese, minutes: 60) }
  let!(:thirty_mins_work) { WorkSession.create(task: read_japanese, minutes: 30) }

  # Associations tests
  it { should have_many(:task_labels) }
  it { should have_many(:labels) }
  it { should have_many(:work_sessions)}

  # Validation tests
  it { should validate_presence_of(:title) }
  it { expect(negative_minutes_task).to be_invalid }
  # Should you be able to create a task with 0 minutes?

  # Method tests
  it 'returns the duration in hours and minutes' do
    expect(read_japanese.duration_in_hours).to eq('1h 2mins')
    expect(read_korean.duration_in_hours).to eq('1h 1min')
    expect(read_chinese.duration_in_hours).to eq('1h')
  end

  it 'returns the total of minutes spent in all its work sessions' do
    expect(read_japanese.time_spent).to eq(90)
  end
end
