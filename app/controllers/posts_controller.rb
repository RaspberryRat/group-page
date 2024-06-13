class PostsController < ApplicationController
  before_action :authorized_poster, except: [:show, :index]
  def index
    @posts = Post.all
    @future_events = Event.future
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :date)
  end

  def authorized_poster
    redirect_to root_path, status: :forbidden unless current_user.admin? || current_user.poster?
  end
end
