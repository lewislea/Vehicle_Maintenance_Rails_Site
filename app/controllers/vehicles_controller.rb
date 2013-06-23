class VehiclesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @vehicle = Vehicle.new
  end

  def index
    # if Vehicle.any?
      @all_vehicles = Vehicle.where(:user_id => current_user.id)
      # @all_vehicles.each do |veh|
      # "year: #{veh.year} make: #{veh.make} model: #{veh.model} mileage: #{veh.mileage}"
      # end
    # else
    #   "You have no vehicles"
    # end
  end

  def create
    params[:vehicle][:mileage] = params[:vehicle][:mileage].gsub(/\,/, '')
    @vehicle = current_user.vehicles.create(params[:vehicle])
    if @vehicle.save
      flash[:notice] = "Your vehicle has been added!"
      redirect_to vehicles_path
    else
      flash[:notice] = "#{@vehicle.errors.full_messages.join(", ")}"
      render 'new' and return
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    params[:vehicle][:mileage] = params[:vehicle][:mileage].gsub(/\,/, '')
    @vehicle = current_user.vehicles.update(params[:id],params[:vehicle])
    if @vehicle.save
      flash[:notice] = "Your vehicle has been updated!"
      redirect_to vehicles_path
    else
      flash[:notice] = "#{@vehicle.errors.full_messages.join(", ")}"
      render 'edit' and return
    end
  end

  def show
  end


end