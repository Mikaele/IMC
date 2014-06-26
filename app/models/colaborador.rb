class Colaborador < ActiveRecord::Base
  belongs_to :user
  belongs_to :perfil
  has_many :calls
end
