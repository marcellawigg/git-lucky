require 'rails_helper'

describe UserServices(User.first) do
    it "returns a list of starred repositories" do
      VCR.use_cassette("user_services#starred_repositories") do
        starred = UserServices.new(User.first).starred_repositories
        expect(starred.count).to eq(0)
    end
  end

  it "returns a list of all repositories" do
    VCR.use_cassette("user_services#all_repositories") do
      all_repos = UserServices.new(User.first).all_repositories
      expect(all_repos.count).to eq(30)
      expect(all_repos.first.name).to eq("ckaminer/poetry")
    end
  end

  it "returns a list of all organizations" do
    VCR.use_cassette("user_services#organizations") do
      organizations = UserServices.new(User.first).organizations
      expect(organizations.count).to eq(0)
    end
  end

  it "returns all followers for a user" do
    VCR.use_cassette("user_services#followers") do
      followers = UserServices.new(User.first).followers
      expect(followers.count).to eq(4)
      expect(followers.first["login"]).to eq("mikedao")
    end
  end

  it "returns all following for a user" do
    VCR.use_cassette("user_services#following") do
      followings = UserServices.new(User.first).following
      expect(followings.count).to eq(4)
      expect(followings.first["login"]).to eq("kjs222")
    end
  end

  it "returns recent activity for a user" do
    VCR.user_cassette("user_services#recent_activity") do
      activity = UserServices.new(User.first).recent_activity
      expect(activity.first["repo"]["name"]).to eq("marcellawigg/git-lucky")
      expect(activity.first["payload"]["commits"].first["message"]).to eq("Added bootstrap so not quite as ugly")
    end
  end

  it "returns all received activity for a user" do
    VCR.user_cassette("user_services#received_activity") do
      activity = UserServices.new(User.first).received_activity
      expect(activity.first["repo"]["name"]).to eq("nickpisciotta/whats_around")
      expect(activity.first["actor"]["login"]).to eq("nickpisciotta")
end
