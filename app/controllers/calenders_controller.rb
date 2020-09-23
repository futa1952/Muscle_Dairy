class CalendersController < ApplicationController

  def index

  end

  def create
    calender = Calender.new(calender_params)
    calender.save!
    @calenders = Calender.where(user_id: current_user.id)
  end

  def update
    calender = Calender.find(params[:id])
    @calenders = Calender.where(user_id: current_user.id)
    calender.update(calender_params)
  end

  def destroy
    @user = User.find(params[:id])
    calender = Calender.find(params[:id])
    calender.destroy
    redirect_to user_path(@user)
  end

  private
  def calender_params
    params.require(:calender).permit(:title, :start, :end, :user_id, :body)
  end

end
