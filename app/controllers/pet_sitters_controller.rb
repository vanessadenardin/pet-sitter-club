class PetSittersController < ApplicationController

    def index
        @pet_sitters = User.where(role: "pet_sitter")
    end

    def new
        @pet_sitter = User.new
    end

    def show
        @pet_sitter = User.find(params[:id])
    end

    def delete
        @pet_sitter.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to pet_sitters_path
    end
end
