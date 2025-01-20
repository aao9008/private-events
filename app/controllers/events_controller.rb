class EventsController < ApplicationController
  def index
    @events = Event.all
    @user = current_user
  end
end
