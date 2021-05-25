class HomeController < ApplicationController
  # load_and_authorize_resource
  
  def index
    @services = Service.all
  end

end
