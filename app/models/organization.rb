class Organization < OpenStruct
  attr_reader :name
  def initialize(org)
    @name = org["name"]
  end

  def self.all(current_user)
    response = UserServices.new(current_user).organizations
    response.map do |org|
      Organization.new(org)
    end
  end
end
