class Call < ActiveRecord::Base
  belongs_to :technic
  belongs_to :client
end
