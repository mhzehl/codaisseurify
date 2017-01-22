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
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song, notice: "Song successfully added"

    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])

    @song.destroy

    redirect_to @song
  end
end
