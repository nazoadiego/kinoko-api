require 'rails_helper'

RSpec.describe Label, type: :model do
  let!(:read_japanese) { build(:task) }
  let!(:read_korean) { build(:task, title: 'Read Korean') }
  let!(:japanese_label) do
    create(:work_session, task: read_japanese)
    label = Label.new(title: 'Japanese')
    label.tasks << read_japanese
    label.save!
    label
  end
  let!(:korean_label) do
    create(:work_session, task: read_korean)
    create(:work_session, task: read_korean, minutes: 30)
    label = Label.new(title: 'Korean')
    label.tasks << read_korean
    label.save!
    label
  end
  let!(:read_label) do
    label = Label.new(title: 'Reading')
    label.tasks << [read_korean, read_japanese]
    label.save!
    label
  end

  # Associations tests
  it { should have_many(:task_labels) }
  it { should have_many(:tasks) }

  # Validation tests
  it { should validate_presence_of(:title) }

  # Methods
  it 'returns the total minutes spent for one work sessions' do
    expect(japanese_label.time_spent).to eq(60)
  end

  it 'returns the total minutes spent for many work sessions' do
    expect(korean_label.time_spent).to eq(90)
  end

  it 'returns the total minutes spent when there are multiple tasks' do
    expect(read_label.time_spent).to eq(150)
  end
end
