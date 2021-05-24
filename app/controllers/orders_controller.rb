class OrdersController < ApplicationController
    load_and_authorize_resource

    def index

        if current_user.client?
            @orders = Order.where(client_id: current_user.id)
        else
            @orders = Order.where(pet_sitter_id: current_user.id)
        end
    end

    def show

        @order = Order.find(params[:id])
    end

    def new

        @order = Order.new
    end
    
    def create
    
        @order = current_user.order.new(order_params)
            if @order.save
                redirect_to order_path
            else
                render :new
            end

    end

    def destroy

        @order.destroy
        flash[:alert] = 'Successfully deleted!'
        redirect_to root_path
    end
    
    # def leave_review

    #     respond_to do |format|
    #         format.html { render orders_path }
    #     end  
    # end

    # def form_complete

    #     required = [:name, :email, :rating, :message]
    #     form_complete = true
    #     required.each do |f|
    #         if params.has_key? f and not params[f].blank?
    #     # that's good news. do nothing
    #         else
    #             form_complete = false
    #         end
    #     end

    #     # if form_complete
    #     #     form_status_msg = 'Thank you for your feedback!'
    #     # else
    #     #     form_status_msg = 'Please fill in all the remaining form fields and resubmit.'
    #     # end

    #     # format.html { render :review, locals: { status_msg: form_status_msg, review: params} }
    # end

    private

    def orders_params
    
        params.require(:order).permit(:client_id, :pet_sitter_id, :date, :status)
    end
    
end
