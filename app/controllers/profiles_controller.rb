class ProfilesController < ApplicationController
  skip_before_action :verify_authenticity_token

  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_user_profile, only: [:update, :edit, :destroy]
  before_action :set_profile, only: %i[ show ]
  before_action :set_form_vars, only: [:new, :edit]
  
  
  def index
    @profiles = Profile.all
    if params[:search]
      @profiles = Profile.where("location = ?", "#{params[:search].downcase}")
    else
      @profiles = Profile.all
    end
  end

  def show
    authorize! :read, @profile
  end

  def new
    @profile = Profile.new
  end

  def edit
    authorize! [:edit, :update], @profile
  end

  def create
    @profile = current_user.profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully deleted." }
      format.json { head :no_content }
    end 
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :playtime, :musictype_id, :demolinks, :location, :teamups, :bio, style_ids: [], image: [])
  end

  def set_user_profile
    @profile = current_user.profile
    if (@profile == nil && current_user.is_admin) || current_user.id == @profile.user_id
      @profile = Profile.find_by_id(params[:id])
    else
      flash[:alert] = "You don't have permission to do that"
      redirect_to profiles_path
    end
  end

  def set_form_vars
    @styles = Style.all
    @musictypes = Musictype.all
  end

end
