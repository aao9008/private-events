class Event < ApplicationRecord
  validates :creator, :date, :name, presence: true

  # Event has a creator 
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  def self.past
    where("date < ?", Date.today).order(date: :desc)
  end

  def self.upcoming
    where("date >= ?", Date.today).order(date: :desc)
  end

  #Event can have many attendees
  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee
end
