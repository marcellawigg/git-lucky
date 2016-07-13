class UserServices
  def initialize(user)
    @_user = user
    @_connection = Faraday.new("https://api.github.com")
    @_connection.headers["Authorization"] = "Token #{user.oauth_token}"
  end

  def starred_repositories
    
  end
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

  def parse(response)
    JSON.parse(response.body)
  end

end
