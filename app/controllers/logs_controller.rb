class LogsController < ApplicationController
  respond_to :json
  
  # def index
  #   @messages = Logs.find(:all)
  #   respond_to do |format|
  #       format.html # index.html.erb
  #       format.json  { render :json => @messages }
  #   end
  # end
  
  def list
    @messages = Logs.find(:all)
    respond_to do |format|
        format.json  { render :json => @messages }
    end
  end

  def create
    Logs.new(:message => params[:message], :user_id => params[:user_id]).save
    render :text => "ok"
  end
end
