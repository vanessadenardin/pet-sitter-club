class PetSittersController < ApplicationController

    def index
        @pet_sitters = User.where(role: "pet_sitter")
    end

    def show

    end
end
