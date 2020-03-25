class DirectorsController < ApplicationController
  before_action :set_director, only: [:edit, :show, :update, :destroy]

  def index
    @directors = Director.all.by_name
  end

  def create
    @director = Director.new(director_params)
    @director.name = @director.name.upcase
    @director.from = @director.from.upcase

    if @director.save
      redirect_to directors_path
    else
      render "new"
    end
  end

  def new
    @director = Director.new
  end

  def edit
  end

  def show
  end

  def update
    if @director.update(director_params)
      redirect_to directors_path(@director)
    else
      render "edit"
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_path
  end

  private

  def set_director
    @director = Director.find(params[:id])
  end

  def director_params
    params[:director].permit(:name, :from, :director_id, :position, :image)
  end


end
