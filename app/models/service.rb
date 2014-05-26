class Service < ActiveRecord::Base
  belongs_to :call
  belongs_to :ic
end
