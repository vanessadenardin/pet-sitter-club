class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_service, only: [:edit, :update]
  
  def index

    @services = Service.all
  end

  def show

      @service = Service.find(params[:id])
  end

  def new

    @service = Service.new
  end

  def create

    @service = current_user.services.new(services_params)
    if @service.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @service.update(services_params)
      redirect_to @service
    else
      render :edit
    end
  end


  def delete

    @service.destroy
    flash[:alert] = 'Successfully deleted!'
    redirect_to services_path
  end

  private

  def set_service

    @service = Service.find(params[:id])
  end

  def services_params
    
    params.require(:service).permit(:name, :description)
  end

end
