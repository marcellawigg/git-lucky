class Repository < OpenStruct
  attr_reader :name
  def initialize(repo)
    @name = repo["full_name"]
  end

  def self.starred_repositories(current_user)
    response = UserServices.new(current_user).starred_repositories
    response.map do |repo|
      Repository.new(repo)
    end
  end

  def self.all_repositories(current_user)
    response = UserServices.new(current_user).all_repositories
    response.map do |repo|
      Repository.new(repo)
    end
  end
end
