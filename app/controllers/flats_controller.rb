class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show ]
  def index
    @flats = Flat.all
  end
  
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(restaurant_params)
    if @flat.save
        redirect_to @flat, notice: "Flat was successfully created."
      else
        render :new, status: :unprocessable_entity
      end

  end

  def show
  end

  private
  def restaurant_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
