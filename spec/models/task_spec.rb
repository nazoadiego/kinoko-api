require 'rails_helper'

RSpec.describe Task, type: :model do
  # Associations
  it { should have_many(:labels)}
  # Validation tests
  pending "need to write validations!"
end
