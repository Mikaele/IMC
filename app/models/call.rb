class Call < ActiveRecord::Base
  has_and_belongs_to_many :services
  belongs_to :client
  has_many :colaboradors
end
