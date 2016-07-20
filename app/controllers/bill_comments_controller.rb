class BillCommentsController < ApplicationController
  before_action :set_bill_comment, only: [:show, :edit, :update, :destroy]

  # GET /bill_comments
  # GET /bill_comments.json
  def index
    @bill_comments = BillComment.all
  end

  # GET /bill_comments/1
  # GET /bill_comments/1.json
  def show
  end

  # GET /bill_comments/new
  def new
    @bill_comment = BillComment.new
  end

  # GET /bill_comments/1/edit
  def edit
  end

  # POST /bill_comments
  # POST /bill_comments.json
  def create
    @bill_comment = BillComment.new(bill_comment_params)

    respond_to do |format|
      if @bill_comment.save
        format.html { redirect_to @bill_comment, notice: 'Bill comment was successfully created.' }
        format.json { render :show, status: :created, location: @bill_comment }
      else
        format.html { render :new }
        format.json { render json: @bill_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_comments/1
  # PATCH/PUT /bill_comments/1.json
  def update
    respond_to do |format|
      if @bill_comment.update(bill_comment_params)
        format.html { redirect_to @bill_comment, notice: 'Bill comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_comment }
      else
        format.html { render :edit }
        format.json { render json: @bill_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_comments/1
  # DELETE /bill_comments/1.json
  def destroy
    @bill_comment.destroy
    respond_to do |format|
      format.html { redirect_to bill_comments_url, notice: 'Bill comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_comment
      @bill_comment = BillComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_comment_params
      params.require(:bill_comment).permit(:author, :content)
    end
end
