class MaterialsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(params[:material]) 
    
    respond_to do |format|
      format.html redirect_to(material_path(@material), :notice => t("notice.material.created"))
    end
  end

  def edit
  end

  def update
  end
end
