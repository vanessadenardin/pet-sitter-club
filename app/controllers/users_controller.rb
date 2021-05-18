class UsersController < ApplicationController
    # load_and_authorize_resource

    def show
        @user = User.find(current_user.id)
    end
end
