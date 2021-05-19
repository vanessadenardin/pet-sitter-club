class ServicesController < ApplicationController
  
  def index
    @services = Service.all
  end

  def show
      @service = Service.find(params[:id])
  end

  def edit
  end

  def delete
    Service.find(params[:id]).destroy
    redirect_to services_path

  end
end
