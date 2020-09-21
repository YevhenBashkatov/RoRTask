class RailwayCarriagesController < ApplicationController
  before_action :set_railway_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @railway_carriages = RailwayCarriage.all
  end

  def show
  end

  def new
    @railway_carriage = RailwayCarriage.new
  end


  def create
    @railway_carriage = RailwayCarriage.new(railway_carriage_params)

    if @railway_carriage.save
      redirect_to @railway_carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @railway_carriage.update(railway_carriage_params)
      redirect_to @railway_carriage
    else
      render :edit
    end
  end

  def destroy
    @railway_carriage.destroy
    redirect_to railway_carriages_path
  end

  private
  def set_railway_carriage
    @railway_carriage = RailwayCarriage.find(params[:id])
  end
  def railway_carriage_params
    params.require(:railway_carriage).permit(:number, :carriage_type, :train_id, :seats_up, :seats_down)
  end

end


