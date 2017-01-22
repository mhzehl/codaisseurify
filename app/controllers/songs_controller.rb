class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @songs = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    artist = Artist.find(params[:artist_id])
    @song = artist.songs.new(song_params)

    if @song.save
      redirect_to artist_path(params[:artist_id]), notice: "Song successfully added"

    else
      redirect_to artist_path(params[:artist_id]), notice: "Couldn't add song. Please try again."
    end
  end

  def destroy
    @song = Song.find(params[:id])

    @song.destroy

    redirect_to artist_path(params[:artist_id])
  end

  private
    def song_params
      params.require(:song).permit(:name, :release_year, :video_url)
    end
end
