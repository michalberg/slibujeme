class Api::V1::MaterialsController < Api::V1::BaseController
  def index
    respond_with(
      Material.order("created_at DESC").last(10).to_json(
        :only => [:id], 
        :include => { 
          :image_assets => { :methods => :image_url, :only => [:id, :image_url] }, 
          :party => { :only => [:id, :title] }, 
          :election => { :only => [:id, :title] }, 
          :topics => { :only => [:id, :title] }, 
          :municipality => { :methods => :full_title, :only => [:id, :full_title] }, 
          :polititians => { :only => [:id, :name] } 
        }
      )
    )
  end
end