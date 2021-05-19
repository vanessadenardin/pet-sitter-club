class UsersController < ApplicationController
    # load_and_authorize_resource

    def show
        @user = User.find(current_user.id)
    end

    def delete
        User.find(params[:id]).destroy
        redirect_to root_path
    end
end
