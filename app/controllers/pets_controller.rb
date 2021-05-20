class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
    @pet_types = PetType.all
  end

  def create
    p @pet
    @pet = current_user.pets.new(pets_params)
    if @pet.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    flash[:alert] = 'Successfully deleted!'
    redirect_to pets_path
  end

  private

    def pets_params
      params.require(:pet).permit(:name, :age, :observations, :pet_types_id)
    end
end
