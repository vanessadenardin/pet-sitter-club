class OrdersController < ApplicationController
    # load_and_authorize_resource param_method: orders_params

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
        # @pet_sitters = []
        if !params[:pet_sitter_id].blank?
            @pet_sitter = User.find(params[:pet_sitter_id])
            @order.pet_sitter = @pet_sitter
        end

        if !params[:search_pet_sitter].blank?
            @pet_sitters = User.where("role = 'pet_sitter' AND (UPPER(first_name) LIKE :search OR UPPER(last_name) LIKE :search)", search: "%#{params[:search_pet_sitter].upcase}%")
        end
    end
    
    def create
        
        @order = current_user.orders.new(orders_params)
        params[:services].each do |key, value|
            if value.to_s.downcase == 'true'
                @order.order_services.new(pet_sitter_service_id: key.to_s, completed: false)
            end
        end
        if @order.save
            redirect_to orders_path
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
    
        params.require(:order).permit(:client_id, :pet_sitter_id, :date, :status, :search_pet_sitter)
    end
    
end
