class MaterialsController < ApplicationController
  autocomplete :municipality, :title, :display_value => :full_title, :extra_data => [:ancestry]
  autocomplete :polititian, :name

  before_filter :find_or_instantiate_user, :only => [:create]
  before_filter :process_search_params, :only => [:advanced_search]

  def search
    unless params.has_key?("q")
      redirect_to root_path
      return
    end
    title = /(^[^\(]+)/.match(params[:q])[1].strip
    @q = Material.search(:municipality_title_start => title, :party_title_start => title, :m => 'or')
    @materials = @q.result
  end

  def advanced_search
    unless @search_params.empty?
      @materials = Material.search(@search_params.merge(:m => 'and')).result(:distinct => true)
    end
  end

  # GET /materials/:id
  def show
    @material = Material.find(params[:id])
  end

  # GET /materials/new
  def new
    @material = Material.new
    @user = current_user || User.new
    2.times { @material.image_assets.build }
    @material.video_assets.build
  end

  # POST /materials
  def create
    polititians = params[:material_polititians].split(",").map{|person| person.strip }.uniq
    @material = Material.new(params[:material])

    respond_to do |format|
      if @material.valid? && @user.valid?

        # save polititians
        polititians.each do |name|
          @material.polititians << Polititian.find_or_create_by_name(name)
        end

        # possibly create and save user
        # sign_user_from_new_material_contact!(@contact)
        sign_in(:user, @user)
        @material.user = @user

        # save material
        @material.save
        format.html { redirect_to @material, :notice => t("notice.material.created") }
      else
        2.times { @material.image_assets.build }
        format.html do
          flash[:alert] = t("alert.material.not_created")
          render action: "new"
        end
      end
    end
  end

  private

  def find_or_instantiate_user
    return @user = current_user if current_user
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new(:email => params[:user][:email], :password => Devise.friendly_token.first(6))
    end
  end

  def process_search_params
    # m(unicipality_name), po(lititian_names), e(lection_id) p(arty_id) t(opic_ids)

    @search_params = {}
    unless params[:m].blank?
      municipality_title = /(^[^\(]+)/.match(params[:m])[1].strip
      @search_params.merge!({:municipality_title_start => municipality_title}) unless params[:m].blank?
    end

    unless params[:po].blank?
      polititians_names = params[:po].split(",").map{ |name| name.strip }
      @search_params.merge!({:polititians_name_in => polititians_names.join(",")}) unless params[:po].blank?
    end

    unless params[:e].blank?
      @search_params.merge!({:election_id_eq => params[:e]})
    end

    unless params[:p].blank?
      @search_params.merge!({:party_id_eq => params[:p]})
    end

    unless params[:t].blank?
      @search_params.merge!({:topics_id_in => params[:t].join(",")})
    end
  end
end
