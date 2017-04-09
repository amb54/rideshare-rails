class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:id)
  end

  def new
    @passenger = Passenger.new
  end

  def edit
    @passenger = Passenger.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
        render :new
    end
  end

  def update
    rider = Passenger.find(params[:id])
    rider.update_attributes(passenger_params)
    rider.save
    redirect_to session[:return_to]
  end

  def destroy
    rider = Passenger.find(params[:id])
    rider.destroy
    redirect_to passengers_path
  end


  #PRIVATE
  private

  def passenger_params
    params.require(:rider).permit(:name , :phone_num)
  end

end # END of class PassengersController
