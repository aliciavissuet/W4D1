class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: { scope: :title,
        message: "each artist can only use one title" }

    belongs_to :artist,
        foreign_key: :artist_id, 
        class_name: :User

    has_many :artwork_shares, 
        foreign_key: :artwork_id, 
        class_name: :ArtworkShare 

    has_many :viewers, 
        through: :artwork_shares, 
        source: :viewer 
end
