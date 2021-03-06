class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_profile, only: %i[ show ]
  before_action :set_form_vars, only: [:new, :edit]
  before_action :set_user_profile, only: [:update, :edit, :destroy]
  
  
  def index
    @profiles = Profile.all
  end

  def show

  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = current_user.profiles.new(profile_params)

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
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end 
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :playtime, :musictype_id, :demolinks, :location, :teamups, :bio, style_ids: [])
  end

  def set_user_profile
    @profile = current_user.profile
  end

  def set_form_vars
    @styles = Style.all
    @musictypes = Musictype.all
  end

end
