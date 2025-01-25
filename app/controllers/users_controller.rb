class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @attended_events = @user.attended_events
    @events = @user.created_events
  end
end
