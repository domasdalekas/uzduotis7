# frozen_string_literal: true

class ServicesController < ApplicationController
  # before_action:load_image,only:[:gear,:bikes]
  def bikes
    @bike = Bike.all # select * from bikes
  end

  def gear
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    redirect_to action: 'bikes' if @bike.save
  end

  def edit
    @bike = Bike.find(params[:id]) # select * from bikes where id=id
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update_attributes(bike_params)
      redirect_to action: 'bikes'

    else
      render action: 'edit'
    end
  end

  def delete
    @bike = Bike.find(params[:id])
    redirect_to action: 'bikes' if @bike.destroy
  end

  def bike_params
    params.require(:bike).permit(:name, :bikeType)
  end
end
