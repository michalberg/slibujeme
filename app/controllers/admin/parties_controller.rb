class Admin::PartiesController < Admin::BaseController
  before_filter :find_party, :only => [:edit, :update, :destroy]
  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(params[:party])
    
    respond_to do |format|
      if @party.save
        format.html { redirect_to admin_parties_path, :notice => t("notice.party.created") }
      else
        format.html do
          flash[:alert] = t("alert.party.not_created")
          render :action => "new"
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to admin_parties_path, :notice => t("notice.party.updated") }
      else
        format.html do
          flash[:alert] = t("alert.party.not_updated")
          render :action => "edit"
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if @party.materials.any?
        format.html { redirect_to admin_parties_path, :alert => t("alert.party.not_deleted") }
      else
        @party.destroy
        format.html { redirect_to admin_parties_path, :notice => t("notice.party.deleted") }
      end
    end
  end
  
  private
  def find_party
    @party = Party.find params[:id]
  end
end
