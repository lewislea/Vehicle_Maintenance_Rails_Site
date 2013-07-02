# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.development? or Rails.env.test?
  VehicleMaintenanceSite::Application.config.secret_token = 'd744b84c1ac2fd5ca36cb392bb3b09de2be1d6009a86cabae6e63bc42c34ec1a67399a1f5fbf4828f6b01d6b2a8b6587ee72f7f5f75ca36df8407d657b8daedf'
else
  VehicleMaintenanceSite::Application.config.secret_token = ENV['SECRET_TOKEN']
end

# heroku config:set SECRET_TOKEN=";alk;icu93jalksdhv;oasgwahtever rake secret"