class JobpunchlistsController < ApplicationController
    before_action :set_jobpunchlist, only: [:show, :edit, :update, :destroy]

  # GET /jobpunchlists
  # GET /jobpunchlists.json
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @jobpunchlists = Jobpunchlist.where(sql_query, query: "%#{params[:query]}%")
    else
      @jobpunchlists = Jobpunchlist.all
    end
  end

  # GET /jobpunchlists/1
  # GET /jobpunchlists/1.json
  def show
  end

  # GET /jobpunchlists/new
  def new
    @jobpunchlist = Jobpunchlist.new
  end

  # GET /jobpunchlists/1/edit
  def edit
  end

  # POST /jobpunchlists
  # POST /jobpunchlists.json
  def create
    @jobpunchlist = Jobpunchlist.new(jobpunchlist_params)

    respond_to do |format|
      if @jobpunchlist.save
        format.html { redirect_to @jobpunchlist, notice: 'Punch list was successfully created.' }
        format.json { render :show, status: :created, location: @jobpunchlist }
      else
        format.html { render :new }
        format.json { render json: @jobpunchlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobpunchlists/1
  # PATCH/PUT /jobpunchlists/1.json
  def update
    respond_to do |format|
      if @jobpunchlist.update(jobpunchlist_params)
        format.html { redirect_to @jobpunchlist, notice: 'Punch list was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobpunchlist }
      else
        format.html { render :edit }
        format.json { render json: @jobpunchlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobpunchlists/1
  # DELETE /jobpunchlists/1.json
  def destroy
    @jobpunchlist.destroy
    respond_to do |format|
      format.html { redirect_to authenticated_root_path, notice: 'Punch list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobpunchlist
      @jobpunchlist = Jobpunchlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobpunchlist_params
      params.require(:jobpunchlist).permit(:title, :description)
    end
end
