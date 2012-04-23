class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  private
  def render_404
    render :template => "application/render_404", :status => :not_found
  end
end
