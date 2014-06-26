class Client < ActiveRecord::Base
  belongs_to :user
  has_many :calls
  #validates_presence_of :user
 # validates_associated :user
end
