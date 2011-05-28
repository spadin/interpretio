class ParticipantsController < ApplicationController
  def list
    @participants = Participants.find(:all)
    respond_to do |format|
        format.json  { render :json => @participants }
    end
  end
  def create
    Participants.new(:conference_id => params[:conference_id], :user_id => params[:user_id]).save
    render :text => "ok"
  end
end
