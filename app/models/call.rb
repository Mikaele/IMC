class Call < ActiveRecord::Base
  belongs_to :technic
  belongs_to :client
  has_and_belongs_to_many :services
end
