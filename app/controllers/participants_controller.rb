class ParticipantsController < ApplicationController
  def index
    @participants = Conference.last.participants
    respond_to do |format|
        format.json  
    end
  end
  def create
    Participants.new(:conference_id => params[:conference_id], :user_id => params[:user_id]).save
    render :text => "ok"
  end
end
