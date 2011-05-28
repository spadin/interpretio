class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  has_and_belongs_to_many :languages
  accepts_nested_attributes_for :languages
end
