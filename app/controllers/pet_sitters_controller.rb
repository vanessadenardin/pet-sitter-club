class PetSittersController < ApplicationController
    
    def index
        @pet_sitters = User.where(role: "pet_sitter")
    end

    def new
        @pet_sitter = User.new
    end

    def show
        @pet_sitter = User.find(params[:id])
        # p PetSitterService.select(where: @pet_sitter.id)
        # @services = PetSitterService.where(pet_sitter_id: @pet_sitter.id).joins(:service)
        # @services.each do |service| 
        #     # p Service.find(service.service_id)
        #     service[:name] = Service.find(service.service_id).name
        # end

    end

    def destroy
        @pet_sitter.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to pet_sitters_path
    end


end
