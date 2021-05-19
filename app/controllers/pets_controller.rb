class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def delete
    Pet.find(params[:id]).destroy
    redirect_to pets_path
  end
end
