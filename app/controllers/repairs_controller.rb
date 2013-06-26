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
    @vehicle = Vehicle.find(params[:vehicle_id])
    @repair = Repair.find(params[:id])
  end

  def update
    params[:repair][:mileage] = params[:repair][:mileage].gsub(/\,/, '')
    @vehicle = Vehicle.find(params[:vehicle_id])
    @repair = @vehicle.repairs.update(params[:id],params[:repair])
    if @repair.save
      flash[:notice] = "Your repair has been updated!"
      redirect_to vehicle_path(@vehicle.id)
    else
      flash.now[:notice] = "#{@repair.errors.full_messages.join(", ")}"
      render 'edit' and return
    end
  end

  def show
    @repair = Repair.where(params[:id])
  end

  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @repair = Repair.find(params[:id])
    @repair.destroy
    redirect_to vehicle_path(@vehicle.id)
  end

  def index
  end



end
