class MaterialsController < ApplicationController
  def index
  end

  def show
    @material = Material.find(params[:id])
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # POST /materials[.json]
  def create
    @material = Material.new(params[:material]) 
    
    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, :notice => t("notice.material.created") }
      end
    end
  end

  def edit
  end

  def update
  end
end
