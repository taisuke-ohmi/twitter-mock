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
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
