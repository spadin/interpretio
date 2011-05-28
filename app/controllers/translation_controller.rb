class TranslationController < ApplicationController
  def index
  end

  def begin
  end
  
  def inviteTranslator(phone)
    Twilio.connect('my_twilio_sid', 'my_auth_token')
    Twilio::Sms.message(CALLER_ID, user_number, 'This is my simple SMS message', 'http://example.com/sms_callback')
  end

end
