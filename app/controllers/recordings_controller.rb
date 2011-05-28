class RecordingsController < ApplicationController
  def index
  end

  def create
    Recording.new(:conference_id => params[:conference_id]).save
  end

end
