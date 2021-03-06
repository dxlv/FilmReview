class FilmsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_film, only: [:show, :edit, :update, :destroy]



  #Index function that controles actions on the index or home page
  def index
    @films = Film.all.order("created_at DESC")
  end

  #function to show each film indivuay
  def show
    if @film.reviews.blank?
      @average_review = 0
    else
      @average_review = @film.reviews.average(:rating).round(2)
    end
  end
  #New function to create a new Films linked to the new film view
  def new
      @film = current_user.films.build
  end

  #create function works with the new function to create a new film
  def create

      @film = current_user.films.build(film_params)
      if @film.save
        redirect_to root_path
      else
        render 'new'
      end

  end

  #function to edit films .. linked to the edit view
  def edit
    authorize! :update, @film
  end

  #works with the edit function to edit films
  def update
    authorize! :update, @film
    if @film.update(film_params)
      redirect_to film_path(@film)
    else
      render 'edit'
    end

  end

  def destroy
    authorize! :manage, @film
    @film.destroy
    redirect_to root_path

  end

  #functions that will be called into main body
  private

    #define what aparamertes are allowed for a film
    def film_params
      params.require(:film).permit(:name, :director, :cast, :desc, :year, :film_img)
    end

    def find_film
      @film = Film.find(params[:id])
    end
end
