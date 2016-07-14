class ActivitiesController < ApplicationController
  def index
    @activities = Activity.recent_activity(current_user)
    @received_activities = Activity.received_activity(current_user)
  end
end
