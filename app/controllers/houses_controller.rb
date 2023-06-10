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

  def show
    @house = House.find(params[:id])
  end

  def edit
    @house = House.find(params[:id])
  end
  def update
    @house = House.find(params[:id])
    if @house.update(house_params)
      redirect_to houses_path
    else
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
    params.require(:house).permit(:house_name, :price, :address, :age, :note)
  end
end
