class Activity < OpenStruct
  attr_reader :repo_name, :message, :created_at
  def initialize(event)
    @repo_name = event["repo"]["name"]
    @message = event["payload"]["commits"].first["message"]
    @created_at = DateTime.parse(event["created_at"]).strftime("%A, %B %e, %Y")
  end

  def self.recent_activity(current_user)
    response = UserServices.new(current_user).recent_activity
    push_events = response.select { |event| event["type"] == "PushEvent" }
    push_events.map do |event|
      Activity.new(event)
    end
  end
end
