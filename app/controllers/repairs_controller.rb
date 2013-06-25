class RepairsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @repair = Repair.new
  end

  def create
    params[:repair][:mileage] = params[:repair][:mileage].gsub(/\,/, '')
    @vehicle = Vehicle.find(params[:vehicle_id])
    @repair = @vehicle.repairs.create(params[:repair])
    if @repair.save
      flash[:notice] = "Your repair has been added!"
      redirect_to vehicle_path(@vehicle)
    else
      flash.now[:notice] = "#{@repair.errors.full_messages.join(", ")}"
      redirect_to new_vehicle_repair_path
    end
  end

  def edit
    @vehicle.repair
    # @repair = Repair.find(params[:vehicle][:repair][:id])
  end

  def update
    params[:repair][:mileage] = params[:repair][:mileage].gsub(/\,/, '')
    @repair = @vehicles.update(params[:id],params[:vehicle])
    if @vehicle.save
      flash[:notice] = "Your vehicle has been updated!"
      redirect_to vehicles_path
    else
      flash.now[:notice] = "#{@vehicle.errors.full_messages.join(", ")}"
      render 'edit' and return
    end
  end

  def show
    @repair = Repair.where(params[:id])
  end

  def destroy
  end

  def index
  end



end
