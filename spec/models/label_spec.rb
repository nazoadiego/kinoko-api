require 'rails_helper'

RSpec.describe Label, type: :model do
  # Associations tests
  it { should have_many(:task_labels) }
  it { should have_many(:tasks) }

  # Validation tests
  it { should validate_presence_of(:title) }
end
