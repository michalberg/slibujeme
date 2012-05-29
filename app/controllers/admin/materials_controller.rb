class Admin::MaterialsController < Admin::BaseController
  before_filter :find_material, :only => [:edit, :update]
  
  def index
    @materials = Material.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @material.update_attributes(params[:material])
        format.html { redirect_to admin_materials_path, :notice => t("notice.material.updated") }
      else
        format.html do
          flash[:alert] = t("alert.material.not_updated")
          render action: "edit"
        end
      end
    end
  end
  
  private
  def find_material
    @material = Material.find params[:id]
  end
end
