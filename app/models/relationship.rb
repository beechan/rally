class Relationship < ActiveRecord::Base
    
    belongs_to :user
    belogns_to :event
end
