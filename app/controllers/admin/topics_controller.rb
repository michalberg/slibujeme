class Admin::TopicsController < Admin::BaseController
  before_filter :find_topic, :only => [:edit, :update, :destroy]
  def index
    @topics = Topic.roots
  end

  def new
    @topic = Topic.new
    @topic.parent_id = params[:parent_id] if params.has_key?(:parent_id)
  end

  def create
    @topic = Topic.new(params[:topic])
    
    respond_to do |format|
      if @topic.save
        format.html { redirect_to admin_topics_path, :notice => t("notice.topic.created") }
      else
        format.html do
          flash[:alert] = t("alert.topic.not_created")
          render :action => "new"
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to admin_topics_path, :notice => t("notice.topic.updated") }
      else
        format.html do
          flash[:alert] = t("alert.topic.not_updated")
          render :action => "edit"
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if @topic.materials.any?
        format.html { redirect_to admin_topics_path, :alert => t("alert.topic.not_deleted") }
      else
        @topic.destroy
        format.html { redirect_to admin_topics_path, :notice => t("notice.topic.deleted") }
      end
    end
  end
  
  private
  def find_topic
    @topic = Topic.find params[:id]
  end
end
