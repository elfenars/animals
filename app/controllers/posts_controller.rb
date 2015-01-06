class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    
    @encontrados = Post.where(tipo: "encontrado").limit(3)
    @perdidos = Post.where(tipo: "perdido").limit(3)
    @adopcion = Post.where(tipo: "adopcion").limit(3)
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
    @encontrados = Post.where(tipo: 'encontrado').page(params[:page])
  end

  def perdidos
    @perdidos = Post.where(tipo: 'perdido').page(params[:page])
  end

  def adopcion
    @adopcion = Post.where(tipo: 'adopcion').page(params[:page])
  end

  # POST /posts
  # POST /posts.json
  def create
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
      params.require(:post).permit(:title, :tipo, :description, :image, :location, :status, :contact, :animal_type, :age, :breed, :user_id)
    end

end
