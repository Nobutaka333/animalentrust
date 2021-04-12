class AnimalsController < ApplicationController
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

  private
  def animal_params
    params.require(:animal).permit(:name, :text, :category_id,:prefecture_id,:storage_place_pet_id,:storage_time_id,:image).merge(user_id: current_user.id)
  end
end
