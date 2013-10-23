class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,except: [:index, :show]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(params[:post_id])

    #@comment = Comment.find(params[:id])

    @comment = Comment.where(post_id: params[:post_id], id: params[:id]).first 
    
    # @comment.user_id = current_user.id
  end

  # POST /comments
  # POST /comments.json
  def create

    @post = Post.find(params[:post_id])

    @comment = @post.comments.build(comment_params)

    @comment.user_id = current_user.id

     if @comment.save
         redirect_to(post_url(@post), notice: 'Comment was successfully created.')
     else 
        redirect_to post_url(@post), alert: 'Comment could not be saved.'
     end

#    @comment = Comment.new(comment_params

    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @post, notice: 'Comment was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @comment }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update

    @post = Post.find(params[:post_id])

    #@comment = Comment.find(params[:id])

    @comment = Comment.where(post_id: params[:post_id], id: params[:id]).first 

    @comment.user_id = current_user.id


      if @comment.update(comment_params)
        redirect_to(post_url(@post), notice: 'Comment was successfully updated.')
      else
        redirect_to post_url(@post), alert: 'Comment could not be updated.'
      end
   
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy

    @post = Post.find(params[:post_id])
    #@comment = Comment.find(params[:id])

    @comment = Comment.where(post_id: params[:post_id], id: params[:id]).first 

    if @comment.destroy
        redirect_to(post_url(@post), notice: 'Comment Deleted successfully.')
      else
        redirect_to post_url(@post), alert: 'Comment could not be deleted.'
    end

    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      #params.require(:comment).permit(:description, :status, :post_id, :user_id)
      params.require(:comment).permit(:description, :post_id)
    end
end
