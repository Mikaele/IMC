class CreateColaboradors < ActiveRecord::Migration
  def change
    create_table :colaboradors do |t|
      t.references :user, index: true
      t.references :perfil
      t.integer :cpf
      t.string :telefone
      t.string :endereco

      t.timestamps
    end
  end
end
