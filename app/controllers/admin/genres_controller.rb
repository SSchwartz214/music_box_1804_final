class Admin::CategoriesController < Admin::BaseController
  before_action :require_admin

 def new
 end

 def create
   @genre = Genre.new(genre_params)
   if @genre.save
     redirect_to genres_path
   end
 end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

end
