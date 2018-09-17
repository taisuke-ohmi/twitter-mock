class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to @post.user
    else
      @post.errors.full_messages.each do |m|
        flash[:alert] = m
      end
      redirect_to @post.user
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted"
      redirect_to @post.user
    else
      @post.errors.full_messages.each do |m|
        flash[:alert] = m
      end
      redirect_to @post.user
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
