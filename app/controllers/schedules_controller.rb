class SchedulesController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :set_schedule, only: [:edit, :update, :destroy]
  
  def new
    @schedule = Schedule.new
    @schedules = Schedule.all
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save 
    redirect_to root_path, notice: '新たなひま時間を保存しました'
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
    @schedules = Schedule.all
    render ''
  end
  
  def destroy
    @schedule.destroy
    redirect_to root_path, notice: 'ひま時間を削除しました'
  end
  
  def update
    if @schedule.update(schedule_params)
      redirect_to root_path , notice: 'ひま時間を編集しました'
    else
      render 'edit'
    end
  end
  
  
  private
  def schedule_params
    params.require(:schedule).permit(:starting_time, :end_time)
  end
  
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
end
