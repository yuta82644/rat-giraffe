class HousesController < ApplicationController
  def index
    @house = House.all
  end

  def new
    @house = House.new
    2.times { @house.stations.build }
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to houses_path(@house)

      # binding.pry
    else
      2.times { @house.stations.build }
      render "new"
    end
  end

  def show
    @house = House.find(params[:id])
    @stations = @house.stations
  end

  def edit
    @house = House.find(params[:id])
    @stations = @house.stations
    @house.stations.build
  end
  def update
    @house = House.find(params[:id])
    @stations = @house.stations
    if @house.update(house_params)
      redirect_to houses_path
    else
      @house.stations.build
      render "edit"
    end
  end
  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path
  end

  private

  def house_params
    params.require(:house).permit(
      :house_name,
      :price,
      :address,
      :age,
      :note,
      stations_attributes: %i[id route_name station_name time],
    )
  end
end
