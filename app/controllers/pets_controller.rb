class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def delete
    @pet.destroy
    flash[:alert] = 'Successfully deleted!'
    redirect_to pets_path
  end
end
