class ServicesController < ApplicationController
  
  def index
    @services = Service.all
  end

  def show
      @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end


  def edit
  end

  def delete
    @service.destroy
    flash[:alert] = 'Successfully deleted!'
    redirect_to services_path
  end


end
