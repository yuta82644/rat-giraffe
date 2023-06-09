class HousesController < ApplicationController
  def index
    @house = House.all
  end

  def new
    @house = House.new
  end

  def create
    # @house = House.find(params[:id])
    @house = House.new(house_params)
    if @house.save
      redirect_to houses_path(@house)

      # binding.pry
    else
      render "new"
    end
  end

  private

  def house_params
    params.require(:house).permit(:house_name, :price, :address, :age, :note)
  end
end
