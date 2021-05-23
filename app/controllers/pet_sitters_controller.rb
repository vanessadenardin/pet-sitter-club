class PetSittersController < ApplicationController
    
    def index

        @pet_sitters = User.where(role: "pet_sitter")
    end

    def new

        @pet_sitter = User.new
    end


    def show

        @user = User.find(params[:id])
        # p @user.pet_sitter_services.joins(:service)
        # @user.pet_sitter_services.each do |service|
        # end
        # @user.reviews.each do |review|
        # end
    end

    def edit

    end

    def update

        if @pet_sitter_service.update(services_params)
            redirect_to @service
        else
            render :edit
        end
    end

    def add_service
        
        pet_sitter_service = PetSitterService.find_by(pet_sitter_id: current_user.id, service_id: params[:service_id])
        if pet_sitter_service
            pet_sitter_service.active = true
            pet_sitter_service.save
        else
            PetSitterService.new(pet_sitter_id: current_user.id, service_id: params[:service_id], active: true)

        end
    end

    def remove_service
        
        pet_sitter_service = PetSitterService.find_by(pet_sitter_id: current_user.id, service_id: params[:service_id])
        
        if pet_sitter_service
            pet_sitter_service.active = false
            pet_sitter_service.save
        else
            PetSitterService.new(pet_sitter_id: current_user.id, service_id: params[:service_id], active: false)

        end

    end

    def destroy

        @pet_sitter.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to pet_sitters_path
    end

    private

    def set_pet_sitter_service

        @pet_sitter_service = PetSitterService.find(params[:id])
    end
    
    def pet_sitter_services_params
    
        params.require(:pet_sitter_service).permit(:price, :active)
    end

end
