class MaterialsController < ApplicationController
  autocomplete :municipality, :title, :display_value => :full_title, :extra_data => [:ancestry]
  autocomplete :polititian, :name
  
  before_filter :find_or_instantiate_user, :only => [:create]

  def index
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
  # def sign_user_from_new_material_contact!(contact)
  #   unless current_user
  #     user = User.find_by_email(contact.email)
  #     if !user
  #       user = User.create(:email => contact.email, :password => Devise.friendly_token.first(6))
  #     end
  #     
  #     sign_in(:user, user)
  #   end    
  # end
  
  def find_or_instantiate_user
    return @user = current_user if current_user
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new(:email => params[:user][:email], :password => Devise.friendly_token.first(6))
    end
  end
end
