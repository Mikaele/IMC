# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin=User.create(:nome=>"Admin",:email=>'admin@mail.com',:password=>'123123123')
tec1=User.create(:nome=>"Tecnico 1",:email=>'tec1@mail.com',:password=>'123123123')
tec2=User.create(:nome=>"Tecnico 2",:email=>'tec2@mail.com',:password=>'123123123')
tec3=User.create(:nome=>"Tecnico 3",:email=>'tec3@mail.com',:password=>'123123123')
cli=User.create(:nome=>"Tecnico Joao",:email=>'cli@mail.com',:password=>'123123123')

p_admin=Perfil.create(:nome=>'Admin',:descricao=>"Administrado do Sistemas")
p_tec3=Perfil.create(:nome=>'Tec3',:descricao=>"Ultimo Nivel tecnico")
p_tec2=Perfil.create(:nome=>'Tec2',:descricao=>"Segundo Nivel tecnico")
p_tec1=Perfil.create(:nome=>'Tec1',:descricao=>"Primeiro Nivel tecnico")

colab1=Colaborador.create(:user_id=>tec1.id,:perfil=>p_tec1.id,:cpf=>12323423,:telefone=>1231232,:endereco=>"Rua das flores")
colab2=Colaborador.create(:user_id=>tec2.id,:perfil=>p_tec2.id,:cpf=>12300423,:telefone=>1221232,:endereco=>"Rua das flores")
colab3=Colaborador.create(:user_id=>tec3.id,:perfil=>p_tec3.id,:cpf=>16688423,:telefone=>1223232,:endereco=>"Rua das flores")
admin=Colaborador.create(:user_id=>admin.id,:perfil=>p_admin.id,:cpf=>16685523,:telefone=>1225532,:endereco=>"Rua das flores")

cliente=Client.create(:user_id=>cli.id,:occupation=>"Aluno",:phone=>8374578)
