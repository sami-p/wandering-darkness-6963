class PlantsController < ApplicationController
  def destroy
    @plot_plant = PlotPlant.find(params[:id])
    @plot_plant.destroy
    redirect_to '/plots'
  end

  private
  def plant_params
    params.permit(:name, :description, :days_to_harvest)
  end
end
