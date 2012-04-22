class Admin::MunicipalitiesController < Admin::BaseController
  before_filter :find_municipality, :only => [:edit, :update, :destroy]
  
  def index
    @municipalities = Municipality.arrange(:order => :title)
  end

  def new
    @municipality = Municipality.new
    @municipality.parent_id = params[:parent_id] if params.has_key?(:parent_id)
  end

  def create
    @municipality = Municipality.new(params[:municipality])
    
    respond_to do |format|
      if @municipality.save
        format.html { redirect_to admin_municipalities_path, :notice => t("notice.municipality.created") }
      else
        format.html do
          flash[:alert] = t("alert.municipality.not_created")
          render :action => "new"
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @municipality.update_attributes(params[:topic])
        format.html { redirect_to admin_municipalities_path, :notice => t("notice.municipality.updated") }
      else
        format.html do
          flash[:alert] = t("alert.municipality.not_updated")
          render :action => "edit"
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if @municipality.materials.any?
        format.html { redirect_to admin_municipalities_path, :alert => t("alert.municipality.not_deleted") }
      else
        @municipality.destroy
        format.html { redirect_to admin_municipalities_path, :notice => t("notice.municipality.deleted") }
      end
    end
  end
  
  private
  def find_municipality
    @municipality = Municipality.find params[:id]    
  end
end
