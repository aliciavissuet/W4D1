class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: { scope: :viewer_id,
        message: "each viewer can only view one painting" }
    validates :artwork_id, :viewer_id, presence: true

    belongs_to :viewer, 
        foreign_key: :viewer_id, 
        class_name: :User

    belongs_to :art, 
        foreign_key: :artwork_id, 
        class_name: :Artwork
end
