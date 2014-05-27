class Service < ActiveRecord::Base
  has_and_belongs_to_many :ics
  has_and_belongs_to_many :calls
end
