class SongsController < ApplicationController
    helper SongsHelper
    
    def index
        @songs = Song.all.sort_by {|obj| obj.title}
    end
    
    def show
        @song = Song.find(params[:id])
    end
    
    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            flash[:user_error] = @song.errors.full_messages
            render :edit
        end
    end
    
    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            flash[:user_error] = @song.errors.full_messages
            render :new
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
