require 'rails_helper'


RSpec.describe Task, type: :model do
  let!(:read_japanese) { create(:task) }

  # Associations tests
  it { should have_many(:task_labels) }
  it { should have_many(:labels) }
  it { should have_many(:work_sessions) }

  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:minutes) }
  it { should validate_numericality_of(:minutes).is_greater_than(0) }

  # Method tests
  it 'returns the duration in hours and minutes' do
    expect(read_japanese.duration_in_hours).to eq('1h')
    read_korean = create(:task, minutes: 61)
    expect(read_korean.duration_in_hours).to eq('1h 1min')
    read_chinese = create(:task, minutes: 62)
    expect(read_chinese.duration_in_hours).to eq('1h 2mins')
  end

  it 'returns the total of minutes spent in all its work sessions' do
    WorkSession.create(task: read_japanese, minutes: 60)
    WorkSession.create(task: read_japanese, minutes: 30)
    expect(read_japanese.time_spent).to eq(90)
  end
end
