class UsersController < ApplicationController

    def show
        @user = User.find(current_user.id)
    end

    def delete

        if @user.id == current_user.id
            @user.active = false
            @user.save
            flash[:alert] = 'Successfully deleted!'
            redirect_to root_path
        end
    end


end
