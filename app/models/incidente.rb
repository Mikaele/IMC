class Incidente < ActiveRecord::Base
  belongs_to :call
  belongs_to :colaborador
end
