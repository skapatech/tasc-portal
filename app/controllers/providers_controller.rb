class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers/search
  def search
    @providers = Provider.search params
  end

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @rating = Rating.new(user: current_user)
  end

  # GET /providers/1/edit
  def edit
    if @provider.ratings.where(user: current_user).empty?
      @provider.ratings << Rating.new(user: current_user)
    end
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render action: 'show', status: :created, location: @provider }
      else
        format.html { render action: 'new' }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:first_name, :middle_initial, :last_name, :email,
      :phone, :cell, :address1, :address2, :city, :state, :zip, :rate, :position,
      :organization, :years_experience, :resume, :language_ids => [],
      expertises_attributes: [:id, :subject_id, :experience, :comment, :_destroy],
      educations_attributes: [:id, :degree_id, :major, :_destroy],
      ratings_attributes: [:id, :rating, :comments, :user_id])
    end
end
