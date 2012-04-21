class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!
  before_filter :authorize_admin!

  private
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = t("alert.authorization.not_admin")
      redirect_to root_path
    end
  end
end