class PlantTagsController < ApplicationController

  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

# {"plant_tag"=>{"tag_id"=>"2"}, "plant_id"=>"7"}


  def create
    @plant = Plant.find(params[:plant_id])
    tag_ids = params[:plant_tag][:tag_id]

    tag_ids.each do |tag_id|
      @tag = Tag.find(tag_id)
      @plant_tag = PlantTag.new(plant: @plant, tag: @tag)
      @plant_tag.save
    end


    redirect_to garden_path(@plant.garden)


  end
end
