class Logs < ActiveRecord::Base
  belongs_to :conference
  belongs_to :user
end
