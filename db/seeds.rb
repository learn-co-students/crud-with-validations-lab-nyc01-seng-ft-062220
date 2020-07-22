50.times do
    Song.create(
        title: Faker::Music.unique.album,
        released: Faker::Boolean.boolean(true_ratio: 0.9),
        release_year: Faker::Number.between(from: 1900, to: 2019),
        artist_name: Faker::Name.unique.name,
        genre: Faker::Music.genre
    )
end