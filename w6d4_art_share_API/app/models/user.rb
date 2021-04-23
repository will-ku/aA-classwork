# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence:true, uniqueness:true

    has_many :artworks, dependent: :destroy,
    foreign_key: :artist_id,
    class_name: :Artwork

    has_many :viewed_artworks, dependent: :destroy, #artworks shared with this user
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_viewers, #set of users with whom an artwork has been shared
        through: :viewed_artworks,
        source: :viewer

    has_many :shared_artworks, #set of art that have been shared with this user
        through: :viewed_artworks,
        source: :artwork
end
