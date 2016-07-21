class LegislatorsController < ApplicationController
  before_action :set_legislator, only: [:show, :edit, :update, :destroy]

  # attr_reader :first_name

  # GET /legislators
  # GET /legislators.json
  def index
    @legislators = Legislator.all
    render json: @legislators.to_json, status: :ok
  end

  # GET /legislators/1
  # GET /legislators/1.json
  def show
    @legislator = Legislator.find(params[:id])
    @votes_id = Vote.all.pluck(:voter_ids)
    @bill = Bill.all.pluck(:short_title, :bill_id_from_api)
    @votes = @votes_id.each do |vote|
      @legVotes = JSON.parse(vote)
    end
    @legVotes = @votes.map do |vote|
      JSON.parse(vote)[@legislator.bio_id]
    end

    @legcomments = LegislatorComment.where(legislator_id: @legislator.id)
     @comments = @legcomments.each do |comment|
       comment
     end

    # render json: @legislator.to_json, status: :ok
    # render json: @legislator, status: :ok
    # ,
   render :json => { :legislator => @legislator, :votes => @legVotes, :bill => @bill, :comments => @comments }
  end

  # GET /legislators/new
  def new

  end

  # GET /legislators/1/edit
  def edit
  end

  # POST /legislators
  # POST /legislators.json
  def create
    @legislator = Legislator.new(legislator_params)

    respond_to do |format|
      if @legislator.save
        format.html { redirect_to @legislator, notice: 'Legislator was successfully created.' }
        format.json { render :show, status: :created, location: @legislator }
      else
        format.html { render :new }
        format.json { render json: @legislator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legislators/1
  # PATCH/PUT /legislators/1.json
  def update
    respond_to do |format|
      if @legislator.update(legislator_params)
        format.html { redirect_to @legislator, notice: 'Legislator was successfully updated.' }
        format.json { render :show, status: :ok, location: @legislator }
      else
        format.html { render :edit }
        format.json { render json: @legislator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legislators/1
  # DELETE /legislators/1.json
  def destroy
    @legislator.destroy
    respond_to do |format|
      format.html { redirect_to legislators_url, notice: 'Legislator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legislator
      @legislator = Legislator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legislator_params
      params.require(:legislator).permit(:first_name, :last_name, :party, :year_elected)
    end
end
