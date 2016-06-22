class StaticPagesController < ApplicationController
  before_action :logged_in_user
  before_action :set_schedule, only: [:edit, :update, :destroy]
  def home
    @owner_events = Event.all.where(owner_id: current_user.id)
    @schedule = Schedule.new
    @schedules = Schedule.all
    @invite_events = []
    @yotei_events=[]
    @kakutei_events=[]
    #@invite_events = current_user.event_relationships.where("event_flag=",nil).events
    a=[]
    b=[]
    c=[]
    event_relations = current_user.event_relationships.where(event_flag: nil)
    event_relations2 = current_user.event_relationships.where(attendance_status: true)
    event_relations3 = current_user.event_relationships.where(event_flag: true)
    
    event_relations.each do |relation|
      a << relation[:event_id]
    end
    event_relations2.each do |relation|
      b << relation[:event_id]
    end
    event_relations3.each do |relation|
      c << relation[:event_id]
    end
    
    Event.all.each do |event|
      for l in a
        if event[:id] == l
          @invite_events << event
        end
      end
    end
    
    Event.all.each do |event|
      for l in b
        if event[:id] == l
          @kakutei_events << event
        end
      end
    end
    Event.all.each do |event|
      for l in c
        if event[:id] == l
          @yotei_events << event
        end
      end
    end

    
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
    @schedules = Schedule.all
    @invite_events = []
    @yotei_events=[]
    #@invite_events = current_user.event_relationships.where("event_flag=",nil).events
    a=[]
    b=[]
    event_relations = current_user.event_relationships.where(event_flag: nil)
    event_relations2 = current_user.event_relationships.where(attendance_status: true)
    
    event_relations.each do |relation|
      a << relation[:event_id]
    end
    event_relations2.each do |relation|
      b << relation[:event_id]
    end

  
    Event.all.each do |event|
      for l in a
        if event[:id] == l
          @invite_events << event
        end
      end
    end
    
    Event.all.each do |event|
      for l in b
        if event[:id] == l
          @yotei_events << event
        end
      end
    end
    render 'home'
  end

  
  def destroy
    @schedule.destroy
    redirect_to root_path, notice: 'ひま時間を削除しました'
  end
  
  def update
    if @schedule.update(schedule_params)
      redirect_to root_path , notice: 'ひま時間を編集しました'
    else
      render 'home'
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:starting_time, :end_time)
  end
  
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
  def get_event_by_status
    
  end

end
