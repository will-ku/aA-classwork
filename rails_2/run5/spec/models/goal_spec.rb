# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string
#  details    :string
#  status     :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:details) }
  it { should allow_value(true, false).for(:status) }
  it { should belong_to(:user) }
end
