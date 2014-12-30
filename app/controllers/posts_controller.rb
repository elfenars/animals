class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    authenticate_user!
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authenticate_user!
  end

  def encontrados
    # @encontrados = Post.find_by(params[:tipo == 'encontrado'])
    @encontrados = Post.where(tipo: 'encontrado')
  end

  def perdidos
    @perdidos = Post.where(tipo: 'perdido')
  end

  def adopcion
    @adopcion = Post.where(tipo: 'adopcion')
  end

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params[:user_id].merge(:user_id => current_user.id))
    @post = current_user.posts.new(post_params)
      if @post.save
        flash[:success] = "Esto fue un exito."
        render :show
      else
        flash[:error] = "Paa, drama."
        render :new
    end
  end

  def update
      if @post.update(post_params)
        flash[:success] = "Esto fue un exito."
        render :show
      else
        flash[:error] = "Paa, drama."
        render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:title, :tipo, :description, :image, :user_id)
    end
end
