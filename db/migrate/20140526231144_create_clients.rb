class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :user
      t.string :occupation
      t.integer :phone

      t.timestamps
    end
  end
end
