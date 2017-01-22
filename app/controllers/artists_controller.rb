class ArtistsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @artists = Artist.order(sort_column + " " + sort_direction)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    @artist = Artist.find(params[:id])

    @artist.destroy

    redirect_to artists_path, notice: "Artist successfully removed"
  end

  private
  def sort_column
    Artist.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
