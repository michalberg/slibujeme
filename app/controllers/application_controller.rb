class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  helper_method :get_last_added_materials, :render_last_added_materials

  private
  def render_404
    render :template => "application/render_404", :status => :not_found
  end


  def render_last_added_materials(count = 10)
    (render get_last_added_materials(count)).join.html_safe
  end

  def get_last_added_materials(count = 10)
    Material.order("created_at DESC").last(10)
  end
end
