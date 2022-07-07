require 'rails_helper'

RSpec.describe TaskLabel, type: :model do
  # Associations tests
  it { should belong_to(:task) }
  it { should belong_to(:label) }

  # Validations tests
end
