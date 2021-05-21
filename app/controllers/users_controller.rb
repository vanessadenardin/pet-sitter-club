class UsersController < ApplicationController
    # load_and_authorize_resource

    def show

        @user = User.find(current_user.id)
        # p @user.pet_sitter_services.joins(:service)
        @user.pet_sitter_services.each do |service|
        end
        @user.reviews.each do |review|
        end
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
