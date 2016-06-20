class EventsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update]
  def show
  end
  
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(user_params)
    if @event.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event= event.find(params[:id])
  end
  
  def update
    @event = event.find(params[:id])
    if @event.update(event_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to event_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:user).permit(:owner_id, :event_name, :place,
                                 :content,
                                 :event_starting_time,:event_end_time)
  end
  
end
