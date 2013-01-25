class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    session_params = session.to_hash.slice('sort', 'ratings')

    if params.slice(:sort, :ratings).empty? && session_params.any?
      flash.keep
      redirect_to movies_path(session_params)
    end

    session[:sort]    = params[:sort]    if params[:sort].present?
    session[:ratings] = params[:ratings] if params[:ratings].present?

    @sort_field = session[:sort]
    @ratings    = session[:ratings] || Movie::RATINGS

    @all_ratings = Movie::RATINGS
    @movies = Movie.order(@sort_field).filter_by_rating(@ratings)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
