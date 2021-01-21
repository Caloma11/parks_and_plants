class PlantsController < ApplicationController

  def create

    @plant = Plant.new(plant_params)

    # Find the parent garden
    @garden = Garden.find(params[:garden_id])

    # Associate the garden with the plant
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      raise
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @garden = @plant.garden
    @plant.destroy
    redirect_to garden_path(@garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end

end
