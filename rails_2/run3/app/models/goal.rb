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
class Goal < ApplicationRecord
    validates :name, :details, presence: true

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User


end
