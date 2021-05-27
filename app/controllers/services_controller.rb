class ServicesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_service, only: [:edit, :update]
  
  def index

    @services = Service.all
    return unless user_signed_in? && current_user.pet_sitter?

    # pet sitters can add for their lists the services available
    
    @pet_sitter_services = PetSitterService.where(pet_sitter_id: current_user.id)
    @services.each do |service|
      begin
        exists = @pet_sitter_services.find_by(service_id: service.id)

        service.update_active(exists.active)
      rescue
        service.update_active(false)
      end
    end
  end

  def show

    @service = Service.includes(params[:id])
  end

  def new

    @service = Service.new
  end

  # only admin can add / edit a new service to the list
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
    
    params.require(:service).permit(:name, :description, :image)
  end

end
