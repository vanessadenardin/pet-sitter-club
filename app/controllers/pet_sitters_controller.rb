class PetSittersController < ApplicationController

    def index
        @pet_sitters = User.where(role: "pet_sitter")
    end

    def new
        @pet_sitter = Pet_sitter.new
    end

    def show

    end

    def destroy
        @pet_sitter.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to pet_sitters_path
    end
end
