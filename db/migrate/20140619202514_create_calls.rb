class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :description
      t.references :service, index: true
      t.string :files
      t.references :client, index: true
      t.timestamp :h_trabalhadas
      t.references :colaborador, index: true
      t.string :estado

      t.timestamps
    end
  end
end
