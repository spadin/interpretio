class ParticipantsController < ApplicationController
  def list
    @participants = Participants.find(:all)
    respond_to do |format|
        format.json  { render :json => @participants }
    end
  end
end
