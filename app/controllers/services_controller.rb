class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
  
  end

  def edit
  end

  def delete
  end
end