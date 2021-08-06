class PlotPlantsController < ApplicationController

  def destroy
    @plot_plant = PlotPlant.find(params[:id, :plot_id])
    @plot_plant.destroy
  end
end
