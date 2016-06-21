class StaticPagesController < ApplicationController
  def home
    @schedule = Schedule.new
    @schedules = Schedule.all
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
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
