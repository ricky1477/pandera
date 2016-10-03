CarrierWave.configure do |config|
  config.dropbox_app_key = "utfeipnfj5bwsaz"
  config.dropbox_app_secret = ENV["APP_SECRET"]
  config.dropbox_access_token = "mcd61dhqlqivrwuu"
  config.dropbox_access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  config.dropbox_user_id = "61136989"
  config.dropbox_access_type = "app_folder"
end