class PetSittersController < ApplicationController
    load_and_authorize_resource
    
    def index
        authorize! :index, User
        @pet_sitters = User.where(role: "pet_sitter")

    end

    def show
        authorize! :show, User
        @user = User.find(params[:id])
    end

    def add_service

        pet_sitter_service = PetSitterService.where(pet_sitter_id: current_user.id, service_id: params[:service_id])
        if pet_sitter_service.count.positive?
            pet_sitter_service[0].active = true
            pet_sitter_service[0].save
        else
            PetSitterService.create(pet_sitter_id: current_user.id, service_id: params[:service_id], active: true)
        end
        redirect_to services_path
    end

    def remove_service
        
        pet_sitter_service = PetSitterService.find_by(pet_sitter_id: current_user.id, service_id: params[:service_id])
        
        if pet_sitter_service
            pet_sitter_service.active = false
            pet_sitter_service.save
        else
            PetSitterService.create(pet_sitter_id: current_user.id, service_id: params[:service_id], active: false)

        end
        redirect_to services_path

    end


end
