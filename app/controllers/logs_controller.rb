class LogsController < ApplicationController
  def index
  end

  def create
    Logs.new(:message => "TEST").save
  end

end
