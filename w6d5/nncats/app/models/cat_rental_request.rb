# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
  validates :start_date, :end_date, presence: true 
  validates :status, inclusion: { :in => ['PENDING', 'DENIED', 'APPROVED'] }

  belongs_to :cat, 
    foreign_key: :cat_id,
    class_name: 'Cat' 

  def overlapping_requests  # CatRentalRequest.overlapping_requests(request) 
    CatRentalRequest.select(:id).where.not(:our_start => self.start_date, :our_end => self.end_date, 
    'cat_rental_requests.start_date >' :our_end 'OR cat_rental_requests.end_date < ' :our_start)
  end
end
