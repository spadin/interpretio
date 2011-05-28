class ConferencesController < ApplicationController
  # GET /conferences
  # GET /conferences.xml
  def index
    @conferences = Conference.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conferences }
    end
  end

  # GET /conferences/1
  # GET /conferences/1.xml
  def show
    @conference = Conference.find_by_title("APIHACKDAY")


    respond_to do |format|
      format.html # show.html.erb
        format.xml do

          @participant = @conference.participants.find_by_phone(params["Caller"])
          @user = User.find_by_phone_number(params["Caller"])
          @paricipant ||= @conference.participants.create(:phone => params["Caller"], :location => params["FromCity"] + params["FromState"], :conference => @conference, :user => @user)

          response = Twilio::TwiML.build do |res|
             res.say "This conference may be recorded"
             res.dial do |call|
               call.conference @conference.title
             end
             # res.dial('708-525-1053', :record => true, :action => "https://24fb.showoff.io" + conference_path(@conference, :format => :xml), :method => 'post')
           end


          render  :xml => response
        end
    end
  end

  # GET /conferences/new
  # GET /conferences/new.xml
  def new
    @conference = Conference.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conference }
    end
  end

  # GET /conferences/1/edit
  def edit
    @conference = Conference.find(params[:id])
  end

  # POST /conferences
  # POST /conferences.xml
  def create
    @conference = Conference.new(params[:conference])

    @conference.conferenceer = params["To"]
    @conference.receiver = params["Conferenceer"]

    respond_to do |format|
      if @conference.save
        format.html { redirect_to(@conference, :notice => 'Conference was successfully created.') }
        format.xml do

          response = Twilio::TwiML.build do |res|
             res.say "This conference may be recorded"
             res.dial('708-525-1053', :record => true, :action => "https://24fb.showoff.io" + conference_path(@conference, :format => :xml), :method => 'post')
           end


          render  :xml => response
        end
      else
       format.html { render :action => "new" }
       format.xml  { render :xml => @conference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /conferences/1
  # PUT /conferences/1.xml
  def update
    @conference = Conference.find(params[:id])

    @conference.recording_url = params["RecordingUrl"]

    respond_to do |format|
      if @conference.save
        format.html { redirect_to(@conference, :notice => 'Conference was successfully updated.') }
        format.xml  do
          response = Twilio::TwiML.build do |res|
            #res.hangup
          end
          render  :xml => response
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.xml
  def destroy
    @conference = Conference.find(params[:id])
    @conference.destroy

    respond_to do |format|
      format.html { redirect_to(conferences_url) }
      format.xml  { head :ok }
    end
  end
end

