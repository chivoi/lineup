class GigsController < ApplicationController
  skip_before_action :verify_authenticity_token
    
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_gig, only: %i[ show ]
  before_action :set_form_vars, only: [:new, :edit]
  before_action :set_user_gig, only: [:update, :edit, :destroy]
    
  def index
      @gigs = Gig.all
  end
  
  def show

  end
  
  def new 
      @gig = Gig.new
  end
  
  def edit 

  end 
  
  def create
    @gig = current_user.gigs.new(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: "Gig was successfully created." }
        format.json { render :show, status: :created, location: @gig }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: "Gig was successfully updated." }
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy 
      @gig.destroy
      respond_to do |format|
        format.html { redirect_to gigs_url, notice: "Gig was successfully destroyed." }
        format.json { head :no_content }
      end 
  end

  private 

  def set_gig
      @gig = Gig.find(params[:id])
  end

  def gig_params
      params.require(:gig).permit(:date, :time, :venue, :location, :description, :musictype_id, :set_length, :tickets_presale, :door_charge, :payment, feature_ids: [])
  end

  # authorization
  def set_user_gig
    @gig = current_user.gigs.find_by_id(params[:id])
    if @gig == nil
      flash[:alert] = "You don't have permission to do that"
      redirect_to gigs_path
    end
  end

  def set_form_vars
    @styles = Style.all
    @payment_types = Gig.payment.keys
    @features = Feature.all
    @musitypes = Musictype.all
  end
end
