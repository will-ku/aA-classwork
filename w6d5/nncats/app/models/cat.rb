# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    validates :birth_date, :description, presence: true
    validates :name, uniqueness: true
    validates :sex, inclusion: {:in => ['m','f']}
    validates :color, inclusion: { :in => ['white', 'grey', 'brown', 'black'] }

  has_many :cat_rental_requests, 
     foreign_key: :cat_id, 
     class_name: 'CatRentalRequest',
     dependent: :destroy 

end
