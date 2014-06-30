class ColaboradorsCalls < ActiveRecord::Base
  belongs_to :colaborador
  belongs_to :call
end
