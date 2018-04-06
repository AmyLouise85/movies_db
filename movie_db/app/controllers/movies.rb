MovieDb::App.controllers :movies do

  get :index, :map => '/' do #creats a sub directory, lists items and maps it onto '/'
    @movies = Movie.order(rating: :desc).limit(5)
    render 'index'
  end

  get :index, :with => :id do
    @movie =Movie.find(params[:id])
    @title = @movie.title
    @genres = @movie.genres
    render 'movie'
  end

 post :index do
   @movie =Movie.new(params[:movie])
   if @movie.save
     redirect "/movies/#{@movie.id}"
   else
     "error"
   end
 end
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end


end
