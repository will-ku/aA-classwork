# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  details    :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Goal < ApplicationRecord
    validates :name, :details, presence: true

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User




end
