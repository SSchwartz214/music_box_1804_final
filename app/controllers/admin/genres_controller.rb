class Admin::CategoriesController < Admin::BaseController
  before_action :require_admin

 def new
 end

 def create
   # @genre = Genre.new
   # if @genre.save
   #   redirect_to genres_path
   # end
 end

end
