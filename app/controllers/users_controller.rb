class UsersController < ApplicationController
    # load_and_authorize_resource

    def show
        @user = User.find(current_user.id)
        # p @user.pet_sitter_services.joins(:service)
        @user.pet_sitter_services = @user.pet_sitter_services.joins(:service)
    end

    def delete
        @user.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to root_path
    end
end
