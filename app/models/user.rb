class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.nickname           = auth_info.info.nickname
      new_user.oauth_token        = auth_info.credentials.token
      new_user.avatar_url         = auth_info.extra.raw_info.avatar_url
    end
  end

  # def self.service(user)
  #   UserServices.new(user)
  # end

  def followers
    UserServices.new(self).followers
  end

  def following
    UserServices.new(self).following
  end

  def starred_repositories
    UserServices.new(self).starred_repositories
  end

  def all_repositories
    UserServices.new(self).all_repositories
  end
end
