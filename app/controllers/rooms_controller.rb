class RoomsController < ApplicationController
  def new
    @room = Room.new(room_params)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  private

  def room_params
    params.permit(animal_id: params[:animal_id])
  end
end
