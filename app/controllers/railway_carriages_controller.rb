class RailwayCarriagesController < ApplicationController
  before_action :set_railway_carriage, only: %i[show edit update destroy]
  before_action :set_train, only: %i[create new]

  def index
    @railway_carriages = RailwayCarriage.all
  end

  def show; end

  def new
    @railway_carriage = RailwayCarriage.new
  end

  def create

    @railway_carriage = @train.railway_carriages.new(railway_carriage_params)
    if @railway_carriage.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit; end

  def update
    if @railway_carriage.update(railway_carriage_params)
      redirect_to @railway_carriage.becomes(RailwayCarriage)
    else
      render :edit
    end
  end

  def destroy
    @railway_carriage.destroy
    redirect_to railway_carriages_path
  end

  protected

  def set_railway_carriage
    @railway_carriage = RailwayCarriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def railway_carriage_params
    params.require(:railway_carriage).permit(:number, :type, :train_id, :seats_up, :seats_down, :side_seats_up, :side_seats_down, :sitting_seats)
  end
end
