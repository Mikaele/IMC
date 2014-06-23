class Call < ActiveRecord::Base
  has_and_belongs_to_many :services
  belongs_to :client
  belongs_to :colaborador
end
