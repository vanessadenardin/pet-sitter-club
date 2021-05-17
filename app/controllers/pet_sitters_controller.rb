class PetSittersController < ApplicationController

    def index
        @petsitters = PetSitter.all
    end
end
