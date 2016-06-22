class EventsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update,:new,:create]
  def show
  end
  
  def new
    @event = Event.new
    
    @users = User.where.not("id = ?",current_user.id)
    
  end
  def create
    event = Event.new(event_params)
    event.owner_id = current_user.id
    params[:post][:user_ids].each do |user_id|
      next if user_id.blank?
      
      relationship = Relationship.new
      relationship.visitor_id = user_id
      event.relationships << relationship
    end

    if event.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      @event = Event.new
      @users = User.where.not("id = ?",current_user.id)
      render "new"
    end
  end

  def edit
    @event= Event.find(params[:id])
  end
  
  #予定を確定させる
  def confirm
    
    redirect_to root_path
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: '予定を変更しました。'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def will
    @event = Event.find(params[:id])
  end

  def will_create_true
    @event = Event.find(params[:id])
    @relation = current_user.event_relationships.where(event_id: @event.id)[0]

    @relation.event_flag = true
    @relation.update(relation_params)
    redirect_to root_path
  end
  
  def will_create_false
    @event = Event.find(params[:id])
    @relation = current_user.event_relationships.where(event_id: @event.id)[0]
    @relation.event_flag = false
    @relation.update(relation_params)
    redirect_to root_path
  end
  
  def attendance
    @event = Event.find(params[:id])
  end
  private

  def event_params
    params.require(:event).permit(:owner_id, :event_name, :place,
                                 :content,
                                 :event_starting_time,:event_end_time)
  end
  def relation_params
    params.permit(:event_flag)
  end
  
 
  
end
