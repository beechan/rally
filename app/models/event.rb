class Event < ActiveRecord::Base
    has_many :relationships
    has_many :users,through: :relationships,
                   dependent:   :destroy
    validates :event_name, presence: true
    validates :content, presence: true
    
    validates :place, presence: true
    validates :event_date, presence: true
end
