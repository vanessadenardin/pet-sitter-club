class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
            format.json { head :forbidden, content_type: 'text/html' }
            format.html { redirect_to main_app.root_url, notice: exception.message }
            format.js   { head :forbidden, content_type: 'text/html' }
        end
    end

    protected

        def configure_permitted_parameters
            
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :role, :post_code])
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :post_code, :role, :abn, :about, :image])
        end

end
