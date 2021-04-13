class AnimalsController < ApplicationController
  before_action :set_animal, only: [:edit, :show, :update, :destroy]

  def index
    @animals = Animal.includes(:user)
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal.id)
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to root_path
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :text, :category_id,:prefecture_id,:animal_area,:storage_place_pet_id,:storage_time_id,:image).merge(user_id: current_user.id)
  end
end

def set_animal
  @animal = Animal.find(params[:id])
end