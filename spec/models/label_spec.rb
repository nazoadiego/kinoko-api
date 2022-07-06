require 'rails_helper'

RSpec.describe Label, type: :model do
  it { should have_many(:tasks)}
  # Validation tests
  pending "need to write validations!"
end
