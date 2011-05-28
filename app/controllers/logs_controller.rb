class LogsController < ApplicationController
  def list
    @messages = Logs.find(:all)
    respond_to do |format|
        format.json  { render :json => @messages, :callback => params[:callback] }
    end
  end

  def create
    Logs.new(:message => params[:message], :user_id => params[:user_id]).save
    render :text => "ok"
  end
end
