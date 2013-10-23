class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :is_admin? ,except: [:index, :show, :category]


  def is_admin?
    if !current_user || current_user.group_id!=1
      redirect_to posts_url, alert: 'Unauthorized User group !'
    end
  end


  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all

    if params[:query]
      q = "%#{params[:query]}%"
      @posts = Post.paginate(:page => params[:page], :per_page => 5).where("title like ? OR introtext like ? OR description like ? ", q , q, q).order('posts.id DESC')
      @count = @posts.count
    else 
      @posts = Post.paginate(:page => params[:page], :per_page => 5).order('posts.id DESC')
    end
  end

  def category
    @posts = Post.includes(:category).where("categories.id" => params[:id]).order('posts.id DESC')
    @category = Category.find(params[:id]);
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = @post.comments.new

    #@comments = @post.comments.all
    #@comments =  @post.comments.all

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    #@post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :introtext, :description, :status, :category_id)
    end
end
