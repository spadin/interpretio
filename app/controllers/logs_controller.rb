class LogsController < ApplicationController
  def list
    @messages = Logs.find(:all)
    respond_to do |format|
        format.json  { render :json => @messages, :callback => params[:callback] }
    end
  end

  def create
    Logs.new(:message => params[:message], :user_id => params[:user_id], :conference_id => params[:conference_id]).save
    
    lastLogId = params[:last_log_id]
    @logs = Logs.find(:all, :conditions => ['id > ?', lastLogId])
    respond_to do |format|
        format.json  { render :json => @logs, :callback => params[:callback] }
    end
  end
end
