class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all(current_user)
  end
end
