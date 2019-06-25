class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    @post = Post.find(params[:id])

  end

  def create
   @post = Post.new(post_params)
   if @post.save
     redirect_to post_path(@post)
   else
     render :new
   end
 end

 def update
   @post = Post.find(params[:id])
   if @post.update(post_params)
     redirect_to post_path(@post)
   else
     render :edit
   end
 end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
