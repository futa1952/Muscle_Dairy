class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  # def event
  #   @user = User.find(params[:id])
  #   @calenders = Calender.where(user_id: @user.id)
  #   @calender = Calender.new
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
