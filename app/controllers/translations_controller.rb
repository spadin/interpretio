class TranslationsController < ApplicationController
  def index
  end

  def create
    Twilio::SMS.create :to => '+12245780974', :from => '+13126983282',
                       :body => "A Spanish Translator is needed.  Please call: 312-698-3282"

    respond_to do |format|
      format.html {redirect_to conference_url(Conference.first) }
      format.xml { render :xml => Conference.first.to_xml }
    end
  end

  def begin
  end
  
  def inviteTranslator(phone)
    Twilio.connect('my_twilio_sid', 'my_auth_token')
    Twilio::Sms.message(CALLER_ID, user_number, 'This is my simple SMS message', 'http://example.com/sms_callback')
  end

end
