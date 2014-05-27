class Call < ActiveRecord::Base
  belongs_to :technic
  belongs_to :client
  has_and_belongs_to_many :services

  validates_presence_of :client_id,:service_ids
  validates_associated :technic,:client,:services
end
