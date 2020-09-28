class CalendersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @calenders = Calender.where(user_id: @user.id)
    @calender = Calender.new
    @calenders = Calender.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @calenders}
      format.json { render :json => @calenders}
    end
  end

  def create
    @calender = Clender.new(calender_params)
    respond_to do |format|
      if @calender.save
        format.html { redirect_to @calender, notice: 'Event was successfully created.' }
        format.json { render :index, status: :created, location: @calender }
      else
        format.html { render :new }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @calender.update(calender_params)
        format.html { redirect_to @calender, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @calender }
      else
        format.html { render :edit }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @calender.destroy
    respond_to do |format|
      format.html { redirect_to calenders_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @calender = Calender.find(params[:id])
  end

  def calender_params
    params.require(:calender).permit(:title, :start, :end, :user_id, :body)
  end


end
