class CreateTechnics < ActiveRecord::Migration
  def change
    create_table :technics do |t|
      t.references :user, index: true
      t.integer :level
      t.integer :cpf, unique:true
      t.string :telefone
      t.string :endereco


      t.timestamps
    end
  end
end
