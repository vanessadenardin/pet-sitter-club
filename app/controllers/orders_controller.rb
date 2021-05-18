class OrdersController < ApplicationController

    def index
        @order = Order.find(current_user.id)
    end
end
