class EventAttendancesController < ApplicationController
  before_action :set_event, only: [ :create ]
  before_action :authenticate_user!, only: [ :create ]

  def create
    @event.attendees << current_user
    flash[:notice] =  "You are attending this event."
    redirect_to @event
  rescue ActiveRecord::RecordInvalid
    flash[:alert] = "You are already attending this event."
    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
