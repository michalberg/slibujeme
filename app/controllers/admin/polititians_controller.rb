class Admin::PolititiansController < Admin::BaseController
  before_filter :find_polititian, :only => [:edit, :update]
  def index
    @polititians = Polititian.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @polititian.update_attributes(params[:polititian])
        format.html { redirect_to admin_polititians_path, :notice => t("notice.polititian.updated") }
      else
        format.html do
          flash[:alert] = t("alert.polititian.not_updated")
          render :action => "edit"
        end
      end
    end
  end
  
  private
  def find_polititian
    @polititian = Polititian.find params[:id]
  end
end
