require "yaml"
config_hash = YAML::load_file("#{RAILS_ROOT}/config/twilio.yml")

# This should be in an initializer or similar
Twilio::Config.setup do
  account_sid  config_hash['account_sid']
  auth_token   config_hash['auth_token']
end
