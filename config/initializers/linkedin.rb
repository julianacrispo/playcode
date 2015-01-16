LinkedIn.configure do |config|
  config.client_id     = ENV["LINKEDIN_KEY"]
  config.client_secret = ENV["LINKEDIN_SECRET"]

#need production redirect
  if Rails.env.production?
    config.redirect_uri = "http://www.techtrack.co/users/auth/linkedin/callback"
  else
    config.redirect_uri = "http://localhost:3000/users/auth/linkedin/callback"
  end
end