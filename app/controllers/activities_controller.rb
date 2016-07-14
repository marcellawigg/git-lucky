class ActivitiesController < ApplicationController
  def index
    @activities = Activity.recent_activity(current_user)
  end
end
