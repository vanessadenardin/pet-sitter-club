class UsersController < ApplicationController
    # load_and_authorize_resource

    def show
        @user = User.find(current_user.id)
        p @user
        # p @user.pet_sitter_services.joins(:service)
    end

    def delete

        @user.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to root_path
    end

    # def user_params

    #     params.require(:user).permit(:role_id)
    # end

end
