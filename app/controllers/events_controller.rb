class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
    @user = current_user
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = "Event was successfully created."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Please fix your errors."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.expect(event: [ :name, :date ])
  end
end
