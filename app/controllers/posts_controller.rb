class PostsController < ApplicationController
  before_action :authorized_poster, except: [:show, :index]
  def index
    @posts = Post.order(date: :desc)
    @future_events = Event.future
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)


    # Check for new tag on the post
    if params[:new_tag].present?
      @tag = Tag.find_or_create_by(name: params[:new_tag].downcase)
      @post.tags << @tag unless @post.tags.include?(@tag)
    end

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      @tags = Tag.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])

    # Check for new tag on the post
    if params[:new_tag].present?
      @tag = Tag.find_or_create_by(name: params[:new_tag].downcase)
      @post.tags << @tag unless @post.tags.include?(@tag)
    end

    if @post.update(post_params)
      if params[:new_tag].present?
        @tag = Tag.find_or_create_by(name: params[:new_tag].downcase)
        @post.tags << @tag unless @post.tags.include?(@tag)
      end

      redirect_to @post, notice: 'Post was successfully updated.'
    else
      @tags = Tag.all
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
    params.require(:post).permit(:title, :content, :date, tag_ids: [])
  end

  def authorized_poster
    redirect_to root_path, status: :forbidden unless current_user.admin? || current_user.poster?
  end
end
