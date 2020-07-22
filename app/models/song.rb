class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist, :year]} 
    validates :released, presence: true
    validates :artist_name, presence: true
    validate :release_date_is_present?

    def release_date_is_present?
        if (self.released == true) && release_date == nil
            self.errors.add(:name, "Need release date!")
        end
    end
end
