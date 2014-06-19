class CreateIncidentes < ActiveRecord::Migration
  def change
    create_table :incidentes do |t|
      t.references :call, index: true
      t.string :comentario
      t.string :anexo
      t.references :colaborador, index: true

      t.timestamps
    end
  end
end
