class Conference < ActiveRecord::Base
  has_many :logs
  has_many :recordings
  has_many :participants
  has_many :users, :through => :participants

end
