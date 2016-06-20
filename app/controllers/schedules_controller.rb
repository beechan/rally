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
  
  def edit
    
  end
  
  def destroy
    @schedule.destroy
    redirect_to root_path, notice: 'ひま時間を削除しました'
  end
  
  def update
    if @schedule.update(schedule_params)
      # 保存に成功した場合は登録画面へ飛ぶ
      redirect_to root_path , notice: 'ひま時間を編集しました'
    else
      #保存に失敗した場合は編集画面に戻す
      render 'edit'
    end
  end
  
  
  private
  def schedule_params
    params.require(:schedule).permit(:starting_time, :end_time)
  end
end
