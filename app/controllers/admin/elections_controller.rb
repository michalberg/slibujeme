class Admin::ElectionsController < Admin::BaseController
  before_filter :find_election, :only => [:edit, :update, :destroy]
  before_filter :sanitize_dates, :only => [:create, :update]
  
  def index
    @elections = Election.all
  end
  
  def new
    @election = Election.new
  end

  def create
    @election = Election.new(params[:election])
    
    respond_to do |format|
      if @election.save
        format.html { redirect_to admin_elections_path, :notice => t("notice.election.created") }
      else
        format.html do
          flash[:alert] = t("alert.election.not_created")
          render :action => "new"
        end
      end
    end
  end

  def edit
    puts @election.inspect
  end

  def update

    respond_to do |format|
      if @election.update_attributes(params[:election])
        format.html { redirect_to admin_elections_path, :notice => t("notice.election.updated") }
      else
        format.html do
          flash[:alert] = t("alert.election.not_updated")
          render action: "edit"
        end
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @election.materials.any?
        format.html { redirect_to admin_elections_path, :alert => t("alert.election.not_deleted") }
      else
        @election.destroy
        format.html { redirect_to admin_elections_path, :notice => t("notice.election.deleted") }
      end
    end
  end
  
  private
  def find_election
    @election = Election.find params[:id]
  end
  
  def sanitize_dates
    @from = Date.new(
      params[:election].delete("from(1i)").to_i, 
      params[:election].delete("from(2i)").to_i, 
      params[:election].delete("from(3i)").to_i
    )
    
    @to = Date.new(
      params[:election].delete("to(1i)").to_i, 
      params[:election].delete("to(2i)").to_i, 
      params[:election].delete("to(3i)").to_i
    )
    params[:election] = params[:election].merge({:from => @from.to_s, :to => @to})
  end
end
