Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "92fd0c67396e69201da1", "a4d532cfc94debe71dbce8b7ee1b1616a3bbd859"
end
