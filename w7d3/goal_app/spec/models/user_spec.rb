require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:user) { User.create!(username: 'willku', password: 'password') }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }

  describe 'associations' do
    it { should have_many(:goals) }
  end

  describe '::find_by_credentials' do
    it 'should return user if found' do
      expect(User.find_by_credentials('willku', 'password')).to eq(user)
    end
    it 'should return nil if user is not found' do
      expect(User.find_by_credentials('willku', '123')).to eq(nil)
    end
  end
end
