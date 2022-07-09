require 'rails_helper'

RSpec.describe WorkSession, type: :model do
  it { should belong_to(:task) }
end
