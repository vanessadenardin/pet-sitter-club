class UsersController < ApplicationController
    # load_and_authorize_resource

    def show
        @user = User.find(current_user.id)
    end

    def delete
        @user.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to root_path
    end
end
