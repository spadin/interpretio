TWILIO_SID = "ACa32c78fe78c7bf389e57b95c48864cbb"
TWILIO_TOKEN = "73fb94978ca93509f7606364a421a6ff"
TWILIO_NUMBER = TWILIO_CALLER_ID = "3124706928"

# This should be in an initializer or similar
Twilio::Config.setup do
  account_sid   'ACa32c78fe78c7bf389e57b95c48864cbb'
  auth_token    '73fb94978ca93509f7606364a421a6ff'
end
