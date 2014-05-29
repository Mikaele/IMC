class CallService < ActiveRecord::Base
  belongs_to :call
  belongs_to :service
end
