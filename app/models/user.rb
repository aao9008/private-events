class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User can be creator of many events 
  has_many :created_events, class_name: "Event", foreign_key: "creator_id", dependent: :destroy

  # User can attend many events 
  has_many :event_attendances, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :event_attendances, source: :attended_event
end
