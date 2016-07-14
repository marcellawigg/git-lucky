class RepositoriesController < ApplicationController
  def index
    @starred_repositories = Repository.starred_repositories(current_user)
    @all_repositories = Repository.all_repositories(current_user)
  end
end
