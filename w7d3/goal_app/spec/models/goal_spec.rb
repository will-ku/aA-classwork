require 'rails_helper'

RSpec.describe Goal, type: :model do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:private) }
    it { should validate_presence_of(:completed) }

    describe 'associations' do
        it { should belong_to(:user) }
    end

    # to-do: class scope method
end