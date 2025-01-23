class EventAttendance < ApplicationRecord
  # The user attending the event 
  belongs_to :attendee, class_name: 'User'

  # The event being attended
  belongs_to :attended_event, class_name: 'Event'

  validates :attendee_id, uniqueness: { scope: :attended_event_id }
end
