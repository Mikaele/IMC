class ServicesCalls < ActiveRecord::Base
  belongs_to :calls
  belongs_to :service
end
