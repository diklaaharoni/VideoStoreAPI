class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies.as_json(only: [:title, :overview, :release_date, :inventory]), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie.nil?
      render json: {
        errors: {
          id: ["No movie with ID #{params[:id]}"]
        }
        }, status: :not_found
      else
        render json: movie.as_json(only: [:id, :title, :overview, :release_date, :inventory]), status: :ok
      end
  end

end
