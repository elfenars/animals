class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @encontrados = Post.where(tipo: "encontrado").order(created_at: :desc).limit(3)
    @perdidos = Post.where(tipo: "perdido").order(created_at: :desc).limit(3)
    @adopcion = Post.where(tipo: "adopcion").order(created_at: :desc).limit(3)
  end

  def show
  end

  def new
    authenticate_user!
    @post = Post.new
  end

  def edit
    authenticate_user!
  end

  def encontrados
    @encontrados = Post.where(tipo: 'encontrado').page(params[:page]).order(created_at: :desc)
  end

  def perdidos
    @perdidos = Post.where(tipo: 'perdido').page(params[:page]).order(created_at: :desc)
  end

  def adopcion
    @adopcion = Post.where(tipo: 'adopcion').page(params[:page]).order(created_at: :desc)
  end

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

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :tipo, :description, :image, :location, :status, :contact, :animal_type, :age, :breed, :user_id)
    end

end
