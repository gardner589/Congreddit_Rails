class LegislatorCommentsController < ApplicationController
  before_action :set_legislator_comment, only: [:show, :edit, :update, :destroy]

  # GET /legislator_comments
  # GET /legislator_comments.json
  def index
    @legislator_comments = LegislatorComment.all
  end

  # GET /legislator_comments/1
  # GET /legislator_comments/1.json
  def show
  end

  # GET /legislator_comments/new
  def new
    @legislator_comment = LegislatorComment.new
  end

  # GET /legislator_comments/1/edit
  def edit
  end

  # POST /legislator_comments
  # POST /legislator_comments.json
  def create
    @legislator = Legislator.find(params[:legislator_id])
    @legislator_comment = LegislatorComment.new(legislator_comment_params)

    respond_to do |format|
      if @legislator_comment.save
        format.html { redirect_to @legislator_comment, notice: 'Legislator comment was successfully created.' }
        format.json { render :show, status: :created, location: @legislator_comment }
      else
        format.html { render :new }
        format.json { render json: @legislator_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legislator_comments/1
  # PATCH/PUT /legislator_comments/1.json
  def update
    respond_to do |format|
      if @legislator_comment.update(legislator_comment_params)
        format.html { redirect_to @legislator_comment, notice: 'Legislator comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @legislator_comment }
      else
        format.html { render :edit }
        format.json { render json: @legislator_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legislator_comments/1
  # DELETE /legislator_comments/1.json
  def destroy
    @legislator_comment.destroy
    respond_to do |format|
      format.html { redirect_to legislator_comments_url, notice: 'Legislator comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legislator_comment
      @legislator_comment = LegislatorComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legislator_comment_params
      params.require(:legislator_comment).permit(:author, :content, :legislator_id)
      binding.pry
    end
  end
