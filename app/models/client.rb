class Client < ActiveRecord::Base
  belongs_to :user
  #validates_presence_of :user
 # validates_associated :user
end
