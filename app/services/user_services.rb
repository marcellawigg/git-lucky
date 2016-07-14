class UserServices
  def initialize(user)
    @_user = user
    @_connection = Faraday.new("https://api.github.com")
  end

  def starred_repositories
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/user/starred")
    parse(response)
  end

  def followers
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/user/followers")
    parse(response)
  end

  def following
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/user/following")
    parse(response)
  end

  def all_repositories
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/user/repos")
    parse(response)
  end

  def organizations
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/users/#{user.nickname}/orgs")
    parse(response)
  end

  def recent_activity
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/users/#{user.nickname}/events")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

private
  def user
    @_user
  end

  def connection
    @_connection
  end

  def nickname
    user.nickname
  end
end
