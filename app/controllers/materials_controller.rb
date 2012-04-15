class MaterialsController < ApplicationController
  autocomplete :municipality, :title, :display_value => :full_title, :extra_data => [:ancestry]
  autocomplete :polititian, :name
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
    polititians = params[:material_polititians].split(",").map{|person| person.strip }.uniq
    @material = Material.new(params[:material])
    
    respond_to do |format|
      if @material.save
        polititians.each do |name|
          @material.polititians << Polititian.find_or_create_by_name(name)
        end
        @material.save
        format.html { redirect_to @material, :notice => t("notice.material.created") }
      end
    end
  end

  def edit
  end

  def update
  end
end
