# https://developers.google.com/accounts/docs/OAuth2Login
Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [:post, :get]
  OmniAuth.config.silence_get_warning = true
  provider :google_oauth2, '795892667358-18eimb5a5scb1jgd2gs6vji28lu99uar.apps.googleusercontent.com', 'U60kXHp2O44NBitq_jn5FOvP', scope: 'email,profile'
  #provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], scope: 'email,profile'
end
