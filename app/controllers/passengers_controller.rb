class PassengersController < ApplicationController
  def index
    @riders = Rider.all.order(:id)
  end

  def new
    @rider = Rider.new
  end

  def edit
    @rider = Rider.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def create
    @rider = Rider.new(rider_params)
    if @rider.save
      redirect_to riders_path
    else
        render :new
    end
  end

  def update
    rider = Rider.find(params[:id])
    rider.update_attributes(rider_params)
    rider.save
    redirect_to session[:return_to]
  end

  def destroy
    rider = Rider.find(params[:id])
    rider.destroy
    redirect_to riders_path
  end


  #PRIVATE
  private

  def rider_params
    params.require(:rider).permit(:name , :phone_num)
  end

end # END of class PassengersController
