class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
