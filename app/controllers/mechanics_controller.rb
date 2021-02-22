class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def edit
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    mechanic.update!(mechanic_params)
    redirect_to "/mechanics/#{mechanic.id}"
  end

  private
  def mechanic_params
    params.permit(:first_name, :last_name, :years_of_experience, :ride_name)
  end
end
