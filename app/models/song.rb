class Song < ApplicationRecord
   
validates :title, presence: true
 
validates :title, uniqueness: { scope: :release_year ,
    message: 'cannot be repeated by the same artist in the same year'}
validates :artist_name, presence: true

  
  
end
