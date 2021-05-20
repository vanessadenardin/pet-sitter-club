class OrdersController < ApplicationController

    def index
        @order = Order.find(current_user.id)
    end

    def destroy
        @order.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to root_path
    end
end
