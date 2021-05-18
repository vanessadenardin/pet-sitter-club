class PetsController < ApplicationController

  def show
    @pets = Pet.find(current_user.id)
  end

  def delete
  end
end
