module SongsHelper
    def self.uniq_genre
        Song.all.map {|t| t.genre}.uniq
    end
end
