# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
#Users
ryan = User.create!(username: "will_climb_rocks")
charlos = User.create!(username: "charlos_gets_buckets")
lina = User.create!(username: "lina_2020")
erik = User.create!(username: "hawaiian_shirts_ftw")
zack = User.create!(username: "music_for_lyfe")
#Artwork
artwork1 = Artwork.create!(title: "Starry Night", artist_id: ryan.id, image_url: "abc")
artwork2 = Artwork.create!(title: "Impression 4", artist_id: charlos.id, image_url: "def")
artwork3 = Artwork.create!(title: "Mona Lisa", artist_id: lina.id, image_url: "asdasd")
artwork4 = Artwork.create!(title: "Michael Jackson and Bubbles", artist_id: erik.id, image_url: "sdfhsdf")
artwork5 = Artwork.create!(title: "Creation of Adam", artist_id: zack.id, image_url: "sdfhsfghsh")
#ArtworkShare
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: charlos.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: zack.id)
ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: ryan.id)
ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: erik.id)
ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: lina.id)