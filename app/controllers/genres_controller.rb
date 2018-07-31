class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
    # if @genre.save
    #   redirect_to admin_genres_path
      # redirect_to genres_path
    # end
  end

end
