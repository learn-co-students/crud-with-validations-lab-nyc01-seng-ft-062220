class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]} 
    validates :released, inclusion: { in: [ true, false ] }
    validates :artist_name, presence: true
    validate :release_year_is_present?

    def release_year_is_present?
        if (self.released == true) && release_year == nil
            self.errors.add(:name, "Need release date!")
        elsif (self.released == true) && release_year > Date.today.year
            self.errors.add(:name, "Can't release songs in the future!")
        end
    end
end