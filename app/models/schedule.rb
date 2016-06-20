class Schedule < ActiveRecord::Base
    belongs_to :user
    validates :starting_time, presence:true
    validates :end_time, presence:true
end
