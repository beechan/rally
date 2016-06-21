class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :event_relationships, class_name: "Relationship",
                                   foreign_key: "visitor_id",
                                   dependent: :destroy
    #参加予定のイベント                               
    has_many :perticipate_events,through: :event_relationships,
                                 source: :event
    
end
