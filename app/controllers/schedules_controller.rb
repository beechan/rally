class SchedulesController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def new
    @schedule = Schedule.new
    @schedules = Schedule.all
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    redirect_to root_path, notice: '新たなひま時間を保存しました'
  end
  
  private
  def schedule_params
    params.require(:schedule).permit(:starting_time, :end_time)
  end
end
