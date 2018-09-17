class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = current_user.posts.build if user_signed_in?
  end
end
