class SongsController < ApplicationController
    def index 
        @songs=Song.all
    end 

    def show 
        @song=Song.find(params[:id])
    end 

    def new 
        @song=Song.new
    end 

    def edit 
        @song=Song.find(params[:id])
    end 

    def create
        @song=Song.create(song_params)
        if @song.valid? 
            redirect_to song_path(@song)
           else 
             flash[:my_errors] = @song.errors.full_messages
                 
                 redirect_to new_song_path(@song)
             end
    end 

    def update 
        @song=Song.find(params[:id])
        if @song.valid? 
            redirect_to song_path(@song)
           else 
             flash[:my_errors] = @song.errors.full_messages
                 
                 redirect_to new_song_path(@song)
             end
    end 
    
    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
      end

    private 
    def song_params 
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
