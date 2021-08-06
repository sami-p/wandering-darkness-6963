class GardensController < ApplicationController

  def show
    @garden = Garden.find(params[:id])
  end

  private
  def garden_params
    params.permit(:name, :organic)
  end
end
