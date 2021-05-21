class PetSittersController < ApplicationController
    
    def index

        @pet_sitters = User.where(role: "pet_sitter")
    end

    def new

        @pet_sitter = User.new
    end


    def show

        @user = User.find(current_user.id)
        # p @user.pet_sitter_services.joins(:service)
        @user.pet_sitter_services.each do |service|
        end
        @user.reviews.each do |review|
        end
    end


    def destroy

        @pet_sitter.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to pet_sitters_path
    end


end
