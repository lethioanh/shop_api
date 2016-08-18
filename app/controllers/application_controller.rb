class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :resource, :collection


  rescue_from ActiveRecord::RecordNotFound do |exception|
    @except = exception
    render :exception
  end

  def new
    initialize_resource
  end

  def create
    build_resource
    resource.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy!
  end
end
