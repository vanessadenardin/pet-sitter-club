class PetsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_pet, only: [:show, :update]
  before_action :set_pet_types, only: [:show, :new]

  def index

    @pets = Pet.all
    # authorize! :index, User.client_id
  end

  def show

    @pet
  end

  def new

    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pets_params)
    if @pet.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @pet.update(pets_params)
      redirect_to @pet
    else
      render :edit
    end
  end

  def destroy

    pet = Pet.find(params[:id])
    pet.destroy
    flash[:alert] = 'Successfully deleted!'
    redirect_to pets_path
  end

  private
  
    def set_pet

      @pet = Pet.find(params[:id])
    end

    def set_pet_types

      @pet_types = PetType.all
    end

    def pets_params

      params.require(:pet).permit(:name, :age, :observations, :pet_types_id, :image)
    end

end
